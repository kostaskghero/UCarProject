package ucar.board.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.board.review.model.ReviewService;
import ucar.board.review.model.ReviewVO;
import ucar.member.model.MemberVO;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	
	/**
	 * 이용후기 작성 폼으로 이동한다.
	 * @return
	 */
	@RequestMapping("auth_review_write_form.do")
	public ModelAndView writeReviewForm() {
		return new ModelAndView("customercenter_review_write_form");
	}

	/**
	 * 이용후기 등록
	 * 게시글을 insert 새로고침시 재입력을 막기 위해 redirect 시킨다. post 방식일때만 등록가능
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "auth_review_write.do", method = RequestMethod.POST)
	public ModelAndView write(ReviewVO vo) {
		reviewService.writeReviewSavingPoint(vo);
		return new ModelAndView("redirect:review_showContentNoHit.do?reviewNo="+ vo.getReviewNo());
	}
	
	/**
	 * 이용후기 작성 시 파일업로드
	 * 스마트 에디터를 사용해 파일을 삽입할 때 서버에 저장하고 에디터에 이미지 태그의 경로를 입력한다.
	 * @param request
	 * @param response
	 */
	@RequestMapping("auth_review_multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, 
			HttpServletResponse response) {
		try {
			HttpSession session=request.getSession(false);
			MemberVO memberVO=(MemberVO)session.getAttribute("loginInfo");
			// header 에서 파일명을 가져온다.
			String oriName = request.getHeader("file-name");
			// 저장될 파일 이름을 변환하고 경로를 설정
			HashMap<String, String> map = reviewService.fileNameFomat(memberVO, oriName);
			// 서버에 저장
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(map.get("filePath"));
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			// 후기 입력 폼에 파일 정보를 기록한다.
			PrintWriter print = response.getWriter();
			print.print(map.get("fileInfo"));
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	/**
	 * 최근 게시물 10개를 보여주는 메서드 , 이후 페이징시 업데이트 해야 한다.
	 * 
	 * @param request
	 * @param response
	 * @return @
	 */
	@RequestMapping("customercenter_review_list.do")
	public ModelAndView list(String pageNo) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("customercenter_review_list");
		mv.addObject("lvo",reviewService.getReviewList(pageNo));
		mv.addObject("bestList", reviewService.getBestReview());
		return mv;
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
	
	/**
	 * 이용후기 추천
	 * reviewNo 에 해당하는 글을 추천한다.
	 * @param reviewVO
	 * @return
	 */
	@RequestMapping("auth_review_likeReview.do")
	@ResponseBody
	public HashMap<String, String> likeReview(ReviewVO reviewVO){
		return reviewService.likeReview(reviewVO);
	}
	
	/**
	 * 이용후기 추천 취소
	 * reviewNo 에 해당하는 글의 추천을 취소한다.
	 * @param reviewVO
	 * @return
	 */
	@RequestMapping("auth_review_likeReviewCancel.do")
	@ResponseBody
	public HashMap<String, String> lickeReviewCancel(ReviewVO reviewVO){
		return reviewService.likeReviewCancel(reviewVO);
	}
}