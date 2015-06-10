package ucar.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
}
