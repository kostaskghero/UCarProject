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

	@RequestMapping("customercenter_home_faq.do")
	public ModelAndView serviceInfoFna(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> list = new ArrayList<String>();
		list.add("자주묻는질문");
		list.add("예약과 결제문의");
		list.add("가입문의");
		list.add("차량이용");
		list.add("사고");
		list.add("탈퇴");
		list.add("기타");
		List<FaqBoardVO> faqList = faqBoardService
				.getFaqListByCategory("자주묻는질문");
		map.put("list", list);
		map.put("faqList", faqList);
		return new ModelAndView("customercenter_faq_form", "data", map);
	}

	@RequestMapping("admin_faq_write_form.do")
	public ModelAndView fqaWriteForm(HttpServletRequest request) {
		System.out.println("faq");
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

	@RequestMapping(value = "admin_faq_write.do", method = RequestMethod.POST)
	public ModelAndView writeFAQ(FaqBoardVO fvo) {
		// System.out.println(fvo);
		faqBoardService.writeFaq(fvo);
		return new ModelAndView("redirect:customercenter_home_faq.do");

	}

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
	@RequestMapping("admin_faq_update.do")
	public ModelAndView updateFAQ(FaqBoardVO fvo){
		faqBoardService.updateFaq(fvo);
		return new ModelAndView("redirect:customercenter_home_faq.do");
	}
	@RequestMapping("admin_faqDelete.do")
	public ModelAndView deleteFAQ(String no){
		faqBoardService.deleteFaq(no);
		return new ModelAndView("redirect:customercenter_home_faq.do");
	}
	@RequestMapping("customercenter_searchFaqByKeyWord.do")
	public ModelAndView searchFaqByKeyWord(String word){
		List<FaqBoardVO> faqList=	faqBoardService.searchFaqByKeyWord(word);
		return new ModelAndView("customercenter_faq_search","faqList",faqList);
	}
	/*
	 * @RequestMapping("customercenter_searchdata.do") public String
	 * searchdata(HttpServletRequest request){ System.out.println("qna 검색");
	 * return "redirect:customercenter_home_fnq.do"; }
	 */
}
