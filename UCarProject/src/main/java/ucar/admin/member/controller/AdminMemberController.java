package ucar.admin.member.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ucar.admin.member.model.AdminMemberService;
import ucar.common.model.PointListVO;
import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;

@Controller
public class AdminMemberController {
	@Resource(name = "adminMemberServiceImpl")
	AdminMemberService adminMemberService;
	@Resource(name = "memberServiceImpl")
	MemberService memberService;

	/**
	 * 전체 회원의 목록을 회원관리 페이지에 뿌려주는 메서드
	 * @return
	 */
	@RequestMapping("admin_member_list.do")
	public ModelAndView member_list() {
		List<MemberVO> memberList = adminMemberService.getAllMemberList();
		return new ModelAndView("admin_member_list", "memberList", memberList);
	}
	/**
	 * 회원목록에서 아이디를 클릭했을때 해당 회원의 아이디로
	 * 결제카드와 운전면허의 상세정보를 검색하여 상세보기 페이지로 이동하여 보여준다. 
	 * @param memberId
	 * @return
	 */
	@RequestMapping("admin_memberDetailInfo.do")
	public ModelAndView memberDetailInfo(String memberId) {
		List<MemberVO> list = adminMemberService
				.findDetailMemberInfoByMemberId(memberId);
		return new ModelAndView("admin_memberDetailInfo", "vo", list);
	}
	/**
	 * 관리자가 회원을 강제탈퇴 시키는 메서드이다. 
	 * DB에 on delete cascade가 명시된 해당아이디의 참조테이블들이 함께 지워진다.
	 * @param memberId
	 * @return
	 */
	@RequestMapping("admin_deleteMember.do")
	public ModelAndView adminDeleteMember(String memberId) {
		adminMemberService.adminDeleteMember(memberId);
		return new ModelAndView("redirect:admin_member_list.do");
	}
	/**
	 * 포인트 내역 페이지를 이동할때 포인트내역 listVO와 함께 이동시킨다. 
	 * 해당 페이지에 들어갈 포인트내역 list 이다.
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("admin_pointHistoryList.do")
	public ModelAndView pointHistory(String pageNo) {
		PointListVO listVO = adminMemberService.getAllPointHistory(pageNo);
		return new ModelAndView("admin_pointHistory_admin", "lvo", listVO);
	}
	/**
	 * 포인트 내역을 회원아이디별로 검색하고 그 결과를 페이징처리하기 위한 메서드 .
	 * 목록의 다음 페이지로 넘어가도 해당아이디의 검색결과가 유지되기위해 검색한
	 * 아이디를 addObject로 함께 넘긴다. 
	 * @param memberId
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("admin_getAllPointHistoryById.do")
	public ModelAndView getAllPointHistoryById(String memberId, String pageNo) {
		ModelAndView mv = new ModelAndView();
		PointListVO listVO = adminMemberService.getAllPointHistoryById(
				memberId, pageNo);
		mv.addObject("lvo", listVO);
		mv.addObject("memberId", memberId);
		mv.setViewName("admin_PointHistoryById");
		return mv;
	}
	/**
	 * 관리자가 회원목록에서 해당회원에게 포인트를 지급하는 메서드 
	 * 이때 포인트 내역에서 운영자 지급이라고 표시된다.
	 * 어떤회원에게 얼마의 포인트를 줄것인지 받아와 포인트를 지급하고 
	 * 회원목록 페이지로 이동시킨다. 
	 * @param point
	 * @param memberId
	 * @return
	 */
	@RequestMapping("admin_givePoint.do")
	public ModelAndView givePoint(int point, String memberId) {
		MemberVO mvo = new MemberVO();
		mvo.setMemberPoint(point);
		mvo.setMemberId(memberId);
		adminMemberService.givePoint(mvo);
		return new ModelAndView("redirect:admin_member_list.do");
	}
}
