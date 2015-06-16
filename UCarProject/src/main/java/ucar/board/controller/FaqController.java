package ucar.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class FaqController {
	@RequestMapping("customercenter_home_fnq.do")
	public ModelAndView serviceInfoFna(HttpServletRequest request){
		System.out.println("QnA");
		ArrayList<String> list = new ArrayList<String>();
		list.add("자주묻는질문");
		list.add("예약과 결제문의");
		list.add("가입문의");
		list.add("차량이용");
		list.add("사고");
		list.add("탈퇴");
		list.add("기타");
		
		return new ModelAndView("customercenter_fnq_form", "list", list);
	}
	@RequestMapping("customercenter_searchdata.do")
	public String searchdata(HttpServletRequest request){
		System.out.println("qna 검색");
		return "redirect:customercenter_home_fnq.do";
	}	
}
