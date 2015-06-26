package ucar.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ucar.board.review.model.ReviewFileVO;
import ucar.board.review.model.ReviewService;
import ucar.board.review.model.ReviewVO;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	@Resource(name="uploadPath")
	private String path;
	@Resource(name="viewPath")
	private String viewPath;
	@RequestMapping("auth_review_write_form.do")
	public ModelAndView writeReviewForm() {
		return new ModelAndView("customercenter_review_write_form");
	}

	/**
	 * 게시글을 insert 새로고침시 재입력을 막기 위해 redirect 시킨다. post 방식일때만 등록가능
	 */
	@RequestMapping(value = "auth_review_write.do", method = RequestMethod.POST)
	public ModelAndView write(ReviewVO vo, ReviewFileVO rfvo) {
		reviewService.writeReview(vo);
		// System.out.println(rfvo);
		List<MultipartFile> list = rfvo.getFile();
		rfvo.setReviewNo(vo.getReviewNo());
		ArrayList<String> nameList = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			// System.out.println(list.get(i).getOriginalFilename().equals(""));
			// String fileName=list.get(i).getOriginalFilename();
			String fileName = list.get(i).getOriginalFilename();

			if (!fileName.equals("")) {
				try {
					nameList.add(viewPath  + vo.getReviewNo()+ "_"+System.currentTimeMillis() +"_"+fileName);
					list.get(i).transferTo(
							new File(path + vo.getReviewNo() + "_"+System.currentTimeMillis() +"_"+fileName));
					System.out.println("fileupload ok:" + fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		rfvo.setFilePathes(nameList);
		System.out.println(nameList);
		for (int j = 0; j < nameList.size(); j++) {
			rfvo.setFilePath(rfvo.getFilePathes().get(j));
			reviewService.registerFile(rfvo);
		}
		// ModelAndView("member_fileupload_result","nameList",nameList);
		System.out.println(rfvo);
		return new ModelAndView("redirect:review_showContentNoHit.do?reviewNo="
				+ vo.getReviewNo());
	}

	/**
	 * 최근 게시물 5개를 보여주는 메서드 , 이후 페이징시 업데이트 해야 한다.
	 * 
	 * @param request
	 * @param response
	 * @return @
	 */
	@RequestMapping("customercenter_review_list.do")
	public ModelAndView list(String pageNo) {
		return new ModelAndView("customercenter_review_list", "lvo",
				reviewService.getReviewList(pageNo));
	}

	/**
	 * 게시글 조회 , 조회수 업데이트 개별 게시물 보여준다. Cookie를 활용하여 읽은 게시물은 조회수를 업데이트하지 않도록 처리한다.
	 * 
	 * @param request
	 * @param response
	 * @return @
	 */
	@RequestMapping("review_showContent.do")
	public ModelAndView showContent(
			int reviewNo,
			@CookieValue(value = "springboard2", required = false) String cookieValue,
			HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("customercenter_review_showcontent_form");
		ReviewVO vo = null;
		List<ReviewFileVO> file=reviewService.getFileByReviewNo(reviewNo);
		if (cookieValue == null) {
			// log.info("springboard2 cookie 존재하지 않으므로 cookie 생성하고 count 증가");
			response.addCookie(new Cookie("springboard2", "|" + reviewNo + "|"));
			vo = reviewService.showContent(reviewNo);
		} else if (cookieValue.indexOf("|" + reviewNo + "|") == -1) {
			// log.info("springboard2 cookie 존재하지만 {}번글은 처음 조회하므로 count증가",no);
			cookieValue += "|" + reviewNo + "|";
			// 글번호를 쿠키에 추가
			response.addCookie(new Cookie("springboard2", cookieValue));
			vo = reviewService.showContent(reviewNo);
		} else {
			// log.info("springboard2 cookie 존재하고 이전에 해당 게시물 읽었으므로 count 증가x");
			vo = reviewService.showContentNoHit(reviewNo);
		}
		mv.addObject("vo", vo);
		mv.addObject("commentList", reviewService.getCommentListByReviewNo(reviewNo));
		mv.addObject("file",file);
		return mv;
	}

	/**
	 * 등록, 수정시 사용하는 개별 게시물 조회 메서드
	 * 
	 * @param no
	 * @return @
	 */
	@RequestMapping("review_showContentNoHit.do")
	public ModelAndView showContentNoHit(int reviewNo) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("customercenter_review_showcontent_form");
		mv.addObject("vo", reviewService.showContentNoHit(reviewNo));
		mv.addObject("commentList", reviewService.getCommentListByReviewNo(reviewNo));
		return mv;
	}

	@RequestMapping("auth_review_delete.do")
	public ModelAndView deleteReview(int reviewNo) {
		reviewService.deleteReview(reviewNo);
		return new ModelAndView("customercenter_review_list", "lvo",
				reviewService.getReviewList("1"));
	}


	@RequestMapping("auth_update_review_form.do")
	public ModelAndView updateReviewForm(ReviewVO vo) {
		return new ModelAndView("customercenter_review_update_form",
				"vo", reviewService.showContentNoHit(vo.getReviewNo()));
	}
	@RequestMapping("review_update.do")
	public ModelAndView updateReview(ReviewVO vo){
		System.out.println("fejhafkhlakfhlaieufhafiuhafieufkhaaeukhfkejafhkjefhlk");
		reviewService.updateReview(vo);
		return new ModelAndView("redirect:review_showContentNoHit.do?reviewNo="
				+ vo.getReviewNo());
	}
	@RequestMapping("auth_review_likeReview.do")
	@ResponseBody
	public HashMap<String, String> likeReview(ReviewVO reviewVO){
		return reviewService.likeReview(reviewVO);
	}
	@RequestMapping("auth_review_likeReviewCancel.do")
	@ResponseBody
	public HashMap<String, String> lickeReviewCancel(ReviewVO reviewVO){
		return reviewService.likeReviewCancel(reviewVO);
	}
}