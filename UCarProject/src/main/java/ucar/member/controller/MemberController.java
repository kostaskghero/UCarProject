package ucar.member.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("member_login.do")
	@ResponseBody
	public boolean login(HttpServletRequest request, MemberVO vo) {
		 System.out.println(vo.getMemberId()+"////0"+vo.getMemberPassword());
		MemberVO mvo = memberService.login(vo);
			if (mvo != null) {
				request.getSession().setAttribute("loginInfo", vo);
				return true;
			}
			else
			return false;
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		if(session!=null)
		session.invalidate();
		return new ModelAndView("home");
	}	
	@RequestMapping(value="registerMember.do",method=RequestMethod.POST)
	public ModelAndView register(MemberVO vo) throws UnsupportedEncodingException {		
		System.out.println("ydrdyrsy//d//d/d//"+vo);
		memberService.registerMember(vo);		
		return 	new ModelAndView("redirect:registerResultView.do?id="+vo.getMemberId());
	}
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String id)  {

		MemberVO vo=memberService.findMemberById(id);		
		return new ModelAndView("/member/register_result","data",vo);
	}
}
