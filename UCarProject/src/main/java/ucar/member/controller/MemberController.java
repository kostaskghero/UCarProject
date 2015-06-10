package ucar.member.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("member_login.do")
	@ResponseBody
	public HashMap<String,Object> loginMember(MemberVO mvo, HttpServletRequest request){
		HashMap<String,Object> map=new HashMap<String,Object>();
		System.out.println("mvo:"+mvo);
		mvo=memberService.loginMember(mvo);
		map.put("flag", "false");
		if(mvo!=null){
			map.put("flag", "ok");
			HttpSession session=request.getSession(false);
			session.setAttribute("loginInfo", mvo);
		}
		return map;
	}
	@RequestMapping("member_logout.do")
	public String logoutMember(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		return "home";
	}
	@RequestMapping("member_register.do")
	public String registerMember(MemberVO mvo){
		System.out.println("mvo:"+mvo);
		memberService.registerMember(mvo);
		return "redirect:member_register_result.do";
	}
}
