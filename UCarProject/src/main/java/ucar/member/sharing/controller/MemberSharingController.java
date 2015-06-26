package ucar.member.sharing.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.common.model.ReservationListVO;
import ucar.member.model.MemberVO;
import ucar.member.sharing.model.MemberSharingService;
import ucar.sharing.reservation.model.ReservationVO;
import ucar.sharing.reservation.model.ReturnVO;

@Controller
public class MemberSharingController {
	@Resource
	private MemberSharingService memberSharingService;
	
	/**
	 * 회원의 예약/이용내역을 List 로 제공
	 * @param request
	 * @return
	 */
	@RequestMapping("auth_memberSharing_reservationHistory.do")
	public ModelAndView reservationHistory(HttpServletRequest request, String pageNo){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("member_reservationHistory");
		HttpSession session=request.getSession(false);
		MemberVO memberVO=(MemberVO)session.getAttribute("loginInfo");
		ReservationListVO reservationListVO=memberSharingService.getReservationListByMemberId(memberVO.getMemberId(), pageNo);
		mv.addObject("reservationList", reservationListVO);
		ReservationListVO usedListVO=memberSharingService.getUsedListByMemberId(memberVO.getMemberId(), pageNo);
		mv.addObject("usedList", usedListVO);
		return mv;
	}
	/**
	 * 예약상태인 차량을 취소
	 * 예약취소하면 DB 에는 기록이 남고 회원은 볼 수 없다
	 * 미구현 >> 이용요금을 결제한 상태에서 취소한 경우 포인트 사용했으면 사용한 포인트 지급, 결제로 쌓은 포인트 반환
	 * 미구현 >> 예약을 하고 이용요금결제하지 않으면 이용시간 10분전에 자동으로 취소
	 * @param reservationVO
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("auth_memberSharing_cancelReservation.do")
	public String cancelReservation(ReservationVO reservationVO, String memberId){
		String sharingStatus=reservationVO.getSharingStatus();
		memberSharingService.cancelReservationByReservationNo(reservationVO);
		if(sharingStatus.equals("이용요금결제")){
			return "redirect:auth_payment_paymentCancel.do?reservationNo="+reservationVO.getReservationNo()+"&memberId="+memberId;
		}
		return "redirect:auth_memberSharing_reservationHistory.do";
	}
	/**
	 * 이용차량 반납
	 * 주행거리 입력받아 반납 DB 에 등록되고 예약상태 DB 에 반납으로 변경
	 * @param reservationVO
	 * @param returnVO
	 * @return
	 */
	@RequestMapping("auth_memberSharing_returnSharingService.do")
	public String returnSharingService(ReservationVO reservationVO, ReturnVO returnVO){
		reservationVO.setReturnVO(returnVO);
		memberSharingService.returnSharingService(reservationVO);
		return "redirect:auth_memberSharing_reservationHistory.do";
	}
	@RequestMapping("auth_memberSharing_checkExtension.do")
	@ResponseBody
	public HashMap<String,Object> checkExtension(ReservationVO resrevationVO){
		return memberSharingService.checkExtension(resrevationVO);
	}
	@RequestMapping("auth_memberSharing_extensionReservation.do")
	public String extensionReservation(ReservationVO reservationVO){
		System.out.println(reservationVO);
		memberSharingService.extensionReservation(reservationVO);
		return "redirect:auth_memberSharing_reservationHistory.do";
	}
}
