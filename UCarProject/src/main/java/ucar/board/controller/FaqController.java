package ucar.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ucar.board.faq.model.FaqBoardService;
import ucar.board.faq.model.FaqBoardVO;

@Controller
public class FaqController {
	@Resource
	private FaqBoardService faqBoardService;
	/**
	 * 자주 붇는 질문 목록 페이지로 이동하는 메서드 
	 * 첫 탭인 자주묻는질문에 해당하는 리스트를 함께 보낸다.
	 * @param request
	 * @return
	 */
	
	@RequestMapping("customercenter_home_faq.do")
	public ModelAndView getFaqList(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<FaqBoardVO> faqList = faqBoardService
				.getFaqListByCategory("자주묻는질문");
		map.put("faqList", faqList);
		return new ModelAndView("customercenter_faq_form", "data", map);
	}
	
	/**
	 * 관리자 세션일때 자주묻는 질문을 작성하는 페이지로 이동한다.
	 * 글 등록시 카테고리 선택을 위한 카테고리 목록을 보내
	 * select로 만든다,
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_faq_write_form.do")
	public ModelAndView fqaWriteForm(HttpServletRequest request) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("자주묻는질문");
		list.add("예약과 결제문의");
		list.add("가입문의");
		list.add("차량이용");
		list.add("사고");
		list.add("탈퇴");
		list.add("기타");
		return new ModelAndView("admin_faq_write_form", "list", list);
	}
	/**
	 * 입력받은 정보로 자주 묻는 질문을 등록한다.
	 * @param fvo
	 * @return
	 */
	@RequestMapping(value = "admin_faq_write.do", method = RequestMethod.POST)
	public ModelAndView writeFAQ(FaqBoardVO fvo) {
		faqBoardService.writeFaq(fvo);
		return new ModelAndView("redirect:customercenter_home_faq.do");

	}
	/**
	 * 사용자가 탭을 클릭하여 카테고리를 바꾸면 선택된 카테고리에 
	 * 해당하는 글 목록을 찾아 반환한다.
	 * @param category
	 * @return
	 */
	
	@RequestMapping("customercenter_getFaqListByCategory.do")
	public ModelAndView getFaqListByCategory(String category) {
		ModelAndView mv = new ModelAndView();
		List<FaqBoardVO> faqList = faqBoardService
				.getFaqListByCategory(category);

		if (category.equals("예약과 결제문의")) {
			mv.setViewName("customercenter_faq_Tab2");
		} else if (category.equals("가입문의")) {
			mv.setViewName("customercenter_faq_Tab3");
		} else if (category.equals("차량이용")) {
			mv.setViewName("customercenter_faq_Tab4");
		} else if (category.equals("사고")) {
			mv.setViewName("customercenter_faq_Tab5");
		} else if (category.equals("탈퇴")) {
			mv.setViewName("customercenter_faq_Tab6");
		} else if (category.equals("기타")) {
			mv.setViewName("customercenter_faq_Tab7");
		}
		mv.addObject("faqList", faqList);
		return mv;
	}
	
	/**
	 * 작성한 자주 묻는 질문을 수정하는 폼으로 이동시키는 메서드
	 * @param no
	 * @return
	 */
	@RequestMapping("admin_faq_update_form.do")
	public ModelAndView faqUpdateForm(String no){
		System.out.println(no+"///////////////////");
		Map<String, Object> map = new HashMap<String, Object>();
		FaqBoardVO fvo = faqBoardService.findFaqByNo(no);
		ArrayList<String> list = new ArrayList<String>();
		list.add("자주묻는질문");
		list.add("예약과 결제문의");
		list.add("가입문의");
		list.add("차량이용");
		list.add("사고");
		list.add("탈퇴");
		list.add("기타");
		map.put("fvo",fvo);
		map.put("list", list);
		return new ModelAndView("admin_faq_update_form","data",map);
	}
	/**
	 * 입력받은 정보로 글을 수정한다.
	 * @param fvo
	 * @return
	 */
	@RequestMapping("admin_faq_update.do")
	public ModelAndView updateFAQ(FaqBoardVO fvo){
		faqBoardService.updateFaq(fvo);
		return new ModelAndView("redirect:customercenter_home_faq.do");
	}
	/**
	 * 글 번호로 해당글을 삭제한다.
	 * @param no
	 * @return
	 */
	@RequestMapping("admin_faqDelete.do")
	public ModelAndView deleteFAQ(String no){
		faqBoardService.deleteFaq(no);
		return new ModelAndView("redirect:customercenter_home_faq.do");
	}
	/**
	 * 자주묻는질문에서 키워드가 포함된 글들을 검색한다. 
	 * @param word
	 * @return
	 */
	@RequestMapping("customercenter_searchFaqByKeyWord.do")
	public ModelAndView searchFaqByKeyWord(String word){
		List<FaqBoardVO> faqList=	faqBoardService.searchFaqByKeyWord(word);
		return new ModelAndView("customercenter_faq_search","faqList",faqList);
	}

}
