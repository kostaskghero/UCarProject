package ucar.admin.member.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ucar.admin.member.model.AdminMemberService;
import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;

@Controller
public class AdminMemberController {
	@Resource(name = "adminMemberServiceImpl")
	AdminMemberService adminMemberService;
	@Resource(name = "memberServiceImpl")
	MemberService memberService;

	@RequestMapping("admin_member_list.do")
	public ModelAndView member_list() {
		List<MemberVO> memberList = adminMemberService.getAllMemberList();
		return new ModelAndView("admin_member_list", "memberList", memberList);
	}

	@RequestMapping("admin_memberDetailInfo.do")
	public ModelAndView memberDetailInfo(String memberId) {
		List<MemberVO> list = adminMemberService
				.findDetailMemberInfoByMemberId(memberId);
		return new ModelAndView("admin_memberDetailInfo", "vo", list);
	}
	@RequestMapping("admin_deleteMember.do")
	public ModelAndView adminDeleteMember(String memberId){
		adminMemberService.adminDeleteMember(memberId);
		return new ModelAndView("redirect:admin_member_list.do");
	}
}
