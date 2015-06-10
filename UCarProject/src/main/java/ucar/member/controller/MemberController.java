package ucar.member.controller;

<<<<<<< HEAD
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
=======
import java.util.HashMap;
>>>>>>> branch 'master' of https://github.com/kostaskghero/UCarProject.git

<<<<<<< HEAD
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;

@Controller
public class MemberController {
	@Resource(name="memberServiceImpl")
	private MemberService memberService;
	
	@RequestMapping("memberRegister.do")
	public ModelAndView list (MemberVO vo) {	
		
		vo.setMemberBirthDate("19900101");//ㅇㅇ??
		String info = memberService.memberRegister(vo);
		return new ModelAndView("redirect:member_register_result.do","data",info);
	}
	@RequestMapping("login.do")
	public ModelAndView login (HttpServletRequest request, HttpServletResponse response,MemberVO vo) {	
		MemberVO mvo=memberService.login(vo);
		if(mvo != null) {
			request.getSession().setAttribute("LoginInfo", mvo);
			return new ModelAndView("member_register_result");
		}
		return new ModelAndView("member_register_result");
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session=request.getSession(false);
		if(session!=null)
		session.invalidate();
		return new ModelAndView("/member/register_result");
	}	
=======
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
>>>>>>> branch 'master' of https://github.com/kostaskghero/UCarProject.git
}
