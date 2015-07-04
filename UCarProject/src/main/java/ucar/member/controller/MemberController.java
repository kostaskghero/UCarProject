package ucar.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.common.model.PointListVO;
import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.CardVO;
import ucar.member.model.DrivingLicenseVO;
import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	/**
	 * 로그인
	 * 로그인 폼에서 입력받은 memberVO (memberId 와 memberPassword) 로 로그인한다.
	 * memberId 가 회원일 경우 session 에 회원 정보를 loginInfo 로 세팅하고
	 * memberId 가 관리자일 경우 session 에 관리자 정보를 admin 으로 세팅한다.
	 * 로그인 결과는 Ajax 로 응답하고
	 * memberId 와 memberPassword 가 일치할 경우 flag 에 ok 정보를 담아 보내고 main 페이지로 이동
	 * memberId 와 memberPassword 가 일치하지 않을 경우 flag 에 fail 정보를 담아 보내고 login_form.jsp 로 이동
	 * @param mvo
	 * @param request
	 * @return
	 */
	@RequestMapping("member_login.do")
	@ResponseBody
	public HashMap<String,Object> loginMember(MemberVO memberVO, HttpServletRequest request){
		HashMap<String,Object> map=new HashMap<String,Object>();
		memberVO=memberService.loginMember(memberVO);
		map.put("flag", "fail");
		if(memberVO!=null){
			map.put("flag", "ok");
			HttpSession session=request.getSession(false);
			if(memberVO.getMemberId().equals("admin")){
				session.setAttribute("admin", memberVO);
			}else{
				session.setAttribute("loginInfo", memberVO);
			}			
		}
		return map;
	}
	
	/**
	 * 로그아웃
	 * 로그인 된 상태에서 session 에 저장된 모든 정보를 소멸시킨다.
	 * 로그아웃 후 home 페이지로 이동한다.
	 * @param request
	 * @return
	 */
	@RequestMapping("member_logout.do")
	public String logoutMember(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:home.do";
	}
	
	/**
	 * 회원가입 폼
	 * 회원가입 폼을 제공하는 페이지 제공한다.
	 * Validation 을 위해 register_form.jsp 에서 사용할 수 있도록 객체를 생성해 전달한다. 
	 * <form:form action="register.do" commandName="memberVO">
	 * @return
	 */
	@RequestMapping(value="member_register_form.do", method=RequestMethod.GET)
	public ModelAndView registerForm(){
		return new ModelAndView("member_register_form","memberVO",new MemberVO());
	}
	
	/**
	 * ID 중복체크
	 * 회원가입 id 중복체크와 길이체크를 한다.
	 * 체크 결과는 Ajax 로 응답한다.
	 * 중복된 id 가 존재하거나 id 의 길이 4자 이상 10자 이하가 아닐 경우
	 * service 계층에서 exception 이 발생하고 exception message 를 Ajax 응답한다.
	 * 중복된 id 가 없고 id 의 조건을 만족하는 경우 flag 에 ok 를 실어서 보낸다.
	 * @param memberId
	 * @return
	 */
	@RequestMapping("member_idCheck.do")
	@ResponseBody
	public HashMap<String,Object> memberIdCheck(String memberId){
		HashMap<String,Object> map=new HashMap<String,Object>();
		try {			
			map.put("flag", memberService.memberIdCheck(memberId));
		} catch (Exception e) {
			map.put("exception", e.getMessage());
		}
		return map;
	}	
	
	/**
	 * 회원가입
	 * 회원가입 폼에서 전달된 회원 가입 정보 (memberVO) 를 member 테이블에 insert 한다.
	 * Validation 검사에서 에러가 있으면 회원가입 폼으로 다시 보낸다.
	 * insert 가 중복되지 않기 위해 redirect 방식으로 전송한다.
	 * @param memberVO
	 * @param result
	 * @return
	 */
	@RequestMapping(value="member_register.do",method=RequestMethod.POST)
	public String registerMember(@Valid MemberVO memberVO, BindingResult result, HttpServletRequest request){
		if(result.hasErrors()){			
			return "member_register_form"; 
		}
		memberService.registerMemberSavingPoint(memberVO);
		memberVO=memberService.findMemberInfoByMemberId(memberVO.getMemberId());
		HttpSession session=request.getSession(false);
		session.setAttribute("loginInfo", memberVO);
		return "redirect:member_register_result.do";
	}
	
	/**
	 * 면허정보 등록 폼
	 * 면허정보 등록하는 폼을 제공한다.
	 * 회원가입 후 alert 창을 띄우고 확인을 선택했을 때 registerLicense_form.jsp 로 이동하게 한다.
	 * 회원가입 후 링크를 제공하고 추가로 입력할 수 있게 한다.
	 * 면허정보 입력에 필요한 licenseLocation 정보가 저장된 테이블에서 리스트를 가져와서
	 * 페이지로 이동하게 된다.
	 * @return
	 */
	@RequestMapping("auth_member_registerLicense_form.do")
	public ModelAndView registerLicenseForm(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("member_registerLicense_form");
		mv.addObject("licenseLocation",memberService.getAllLicenseLocationList());
		return mv;		
	}
	
	/**
	 * 면허정보 등록
	 * 동일한 면허번호가 존재할 경우 exception 메세지를 전송하고
	 * 정상적으로 면허정보 등록될 경우 등록메세지를 전송한다.
	 * @param memberVO
	 * @param drivingLicenseVO
	 * @return
	 */
	@RequestMapping("auth_member_registerLicense.do")
	public ModelAndView registerLicense(MemberVO memberVO, DrivingLicenseVO drivingLicenseVO){
		ModelAndView mv=new ModelAndView();
		memberVO.setDrivingLicenseVO(drivingLicenseVO);
		mv.setViewName("member_addRegister_result");
		try {
			memberService.registerLicense(memberVO);
			mv.addObject("result","ok");
			mv.addObject("message","면허정보가 등록되었습니다.");
		} catch (Exception e) {
			mv.addObject("result","fail");
			mv.addObject("message",e.getMessage());
		}
		return mv;
	}
	
	/**
	 * 결제카드 등록
	 * 동일한 카드번호가 존재할 경우 exception 메세지를 전송하고
	 * 정상적으로 결제카드 등록될 경우 등록메세지를 전송한다.
	 * @param memberVO
	 * @param cardVO
	 * @return
	 */
	@RequestMapping("auth_member_registerCard.do")
	public ModelAndView registerCard(MemberVO memberVO, CardVO cardVO){
		ModelAndView mv=new ModelAndView();
		memberVO.setCardVO(cardVO);
		mv.setViewName("member_addRegister_result");
		try {
			memberService.registerCard(memberVO);
			mv.addObject("result","ok");
			mv.addObject("message","결제카드가 등록되었습니다.");
		} catch (Exception e) {
			mv.addObject("result","fail");
			mv.addObject("message",e.getMessage());
		}
		return mv;
	}
	
	/**
	 * 결제카드 삭제
	 * 선택한 카드번호에 해당하는 정보를 card table 에서 삭제한다.
	 * 삭제 후 카드정보 페이지로 이동한다.
	 * @param cardVO
	 * @param memberId
	 * @return
	 */
	@RequestMapping("auth_member_deleteCard.do")
	public String deleteCard(CardVO cardVO, String memberId){
		memberService.deleteCardByCardNo(cardVO.getCardNo());
		return "redirect:auth_member_cardInfo_view.do?memberId="+memberId;
	}
	
	/**
	 * 회원 마이페이지 제공
	 * 마이페이지 화면에 session 에 저장된 회원 Id 에 해당하는
	 * 정보를 조회해서 제공한다.
	 * @param request
	 * @return
	 */
	@RequestMapping("auth_member_myPage.do")
	public ModelAndView memberPage(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO memberVO=(MemberVO)session.getAttribute("loginInfo");
		memberVO=memberService.findMemberInfoByMemberId(memberVO.getMemberId());
		return new ModelAndView("member_myPage", "memberInfo", memberVO);
	}
	
	/**
	 * 회원정보 수정하는 폼 제공
	 * validation 적용을 위해 MemberVO 객체 생성
	 * @return
	 */
	@RequestMapping(value="auth_member_updateMember_form.do", method=RequestMethod.GET)
	public ModelAndView updateForm(){
		return new ModelAndView("member_updateMember_form","memberVO",new MemberVO());
	}
	
	/**
	 * 회원정보 수정
	 * email, phone 정보 수정하고 수정완료하면 result 페이지로 이동
	 * 수정된 정보를 loginInfo session 에 세팅
	 * @param memberVO
	 * @param result
	 * @param request
	 * @return
	 */
	@RequestMapping("auth_member_updateMember.do")
	public ModelAndView updateMember(MemberVO memberVO, BindingResult result, HttpServletRequest request){
		if(result.hasErrors()){			
			return new ModelAndView("member_updateMember_form"); 
		}
		memberVO=memberService.updateMember(memberVO);
		return new ModelAndView("member_updateMember_result","message","회원정보수정완료");
	}
	
	/**
	 * 회원비밀번호 수정
	 * 기존 비밀번호가 일치하는지 먼저 체크. 일치하지않으면 flag 가 fail
	 * 일치하면 비밀번호 수정하고 수정된 정보를 loginInfo session 에 세팅
	 * @param oriMemberPassword
	 * @param memberVO
	 * @param request
	 * @return
	 */
	@RequestMapping("auth_member_updateMemberPassword.do")
	public ModelAndView updateMemberPassword(String oriMemberPassword, MemberVO memberVO, HttpServletRequest request){
		HashMap<String, Object> map=memberService.updateMemberPassword(oriMemberPassword, memberVO);
		if(map.get("flag")=="ok"){
			HttpSession session=request.getSession(false);
			session.setAttribute("loginInfo", map.get("memberVO"));
		}
		return new ModelAndView("member_updateMember_result","message",map.get("message"));
	}
	
	/**
	 * 회원의 운전면허 정보를 검색해서 제공
	 * @param memberVO
	 * @return
	 */
	@RequestMapping("auth_member_lisenseInfo_view.do")
	public ModelAndView licenseInfoView(MemberVO memberVO){
		memberVO=memberService.findLicenseInfoByMemberId(memberVO.getMemberId());
		return new ModelAndView("member_lisenseInfo_view","info",memberVO);		
	}
	
	/**
	 * 회원의 카드정보를 검색해서 제공
	 * @param memberId
	 * @return
	 */
	@RequestMapping("auth_member_cardInfo_view.do")
	public ModelAndView cardInfoView(String memberId){
		List<MemberVO> list=memberService.findCardInfoByMemberId(memberId);
		return new ModelAndView("member_cardInfo_view","info",list);		
	}
	
	/**
	 * 회원의 memberId 로 저장된 결제카드의 수를 카운트
	 * 회원 당 결제카드는 3개까지 등록가능
	 * 3개가 초과하면 exception 메세지를 ajax 로 응답
	 * @param memberId
	 * @return
	 */
	@RequestMapping("auth_member_countCard.do")
	@ResponseBody
	public HashMap<String,Object> countCard(String memberId){
		HashMap<String,Object> map=new HashMap<String,Object>();
		try {
			map.put("result", memberService.countCardByMemberId(memberId));
		} catch (Exception e) {
			map.put("exception", e.getMessage());
		}
		return map;
	}
	
	/**
	 * 회원탈퇴
	 * 정상적으로 삭제완료되면 session 을 종료하는 member_logout.do 로 이동하고
	 * 정상적으로 삭제되지 않으면 다시 회원탈퇴 폼으로 이동한다.
	 * @param memberVO
	 * @return
	 */
	@RequestMapping("auth_member_deleteMember.do")
	@ResponseBody
	public String deleteMember(MemberVO memberVO){
		int count=memberService.deleteMember(memberVO);
		if(count==0){
			return "fail";
		}
		return "ok";
	}
	
	@RequestMapping("auth_member_getPointListByMemberId.do")
	public ModelAndView getPointListByMemberId(PointHistoryVO pointHistoryVO, HttpServletRequest request){
		if(pointHistoryVO.getSearchPeriod()==null || pointHistoryVO.getSearchPeriod().equals(""))
			pointHistoryVO.setSearchPeriod("1");
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession(false);
		MemberVO memberVO=(MemberVO)session.getAttribute("loginInfo");
		memberVO=memberService.findMemberInfoByMemberId(memberVO.getMemberId());
		pointHistoryVO.setMemberId(memberVO.getMemberId());
		PointListVO listVO=memberService.getPointListByMemberId(pointHistoryVO);
		mv.setViewName("member_pointHistory");
		mv.addObject("memberVO", memberVO);
		mv.addObject("pointList", listVO);
		mv.addObject("searchPeriod", pointHistoryVO.getSearchPeriod());
		return mv;
	}
	/**
	 * 회원 아이디 찾기 
	 * @param request
	 * @param vo
	 * @param response
	 * @return
	 */
	@RequestMapping("member_findMemberId.do")
	public String findMemberId(HttpServletRequest request,Model model,MemberVO mvo){
		mvo = memberService.findMemberId(mvo);
		if (mvo != null) {
			model.addAttribute("vo", mvo);
			return "member_findMemberId_result";
		} else {
			model.addAttribute("flag", "fail");
			return "member_findMemberId_form";
		}
	}
	/**
	 * 회원 비밀번호 찾기
	 * @param request
	 * @param mvo
	 * @param model
	 * @return
	 */
	@RequestMapping("member_findMemberPassword.do")
	   public String findMemberPassword(HttpServletRequest request,Model model ,MemberVO mvo) {
	      mvo = memberService.findMemberPassword(mvo);
	      if (mvo != null) {
	    	  model.addAttribute("vo", mvo);
				return "member_findMemberPassword_result";
	      } else {
	    	  model.addAttribute("flag", "fail");
	    	 return "member_findMemberPassword_form";
	      }
	   }
}
