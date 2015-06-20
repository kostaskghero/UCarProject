package ucar.sharing.reservation.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.car.model.CarVO;
import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;
import ucar.sharing.reservation.model.ReservationService;
import ucar.sharing.reservation.model.ReservationVO;
import ucar.sharing.reservation.model.ReturnVO;

@Controller
public class ReservationController {
	@Resource
	private ReservationService reservationService;
	@Resource
	private MemberService memberService;
	/**
	 * 1. 회원의 운전면허 정보가 있는지 확인
	 * 2. 이용을 원하는 시간에 회원이 다른 차를 예약했는지 확인
	 * @param reservationVO
	 * @param memberVO
	 * @return
	 */
	@RequestMapping("auth_reservation_checkMemberReservation.do")
	@ResponseBody
	public Object checkMemberReservation(ReservationVO reservationVO, MemberVO memberVO){
		reservationVO.setMemberVO(memberVO);
		return reservationService.checkMemberReservation(reservationVO);
	}
	/**
	 * 자동차예약
	 * 선택한 정보를 예약 DB 에 입력
	 * insert 는 한번만 되도록 redirect 한다.
	 * @param reservationVO
	 * @param carVO
	 * @param memberVO
	 * @return
	 */
	@RequestMapping("auth_reservation_reservationCar.do")
	public String reservationInfoView(ReservationVO reservationVO, CarVO carVO, MemberVO memberVO){
		reservationVO.setCarVO(carVO);
		reservationVO.setMemberVO(memberVO);
		reservationService.reservationCar(reservationVO);
		return "redirect:auth_reservation_reservationResult.do?reservationNo="+reservationVO.getReservationNo()+"&memberId="+memberVO.getMemberId();
	}
	/**
	 * 예약한 내역을 제공
	 * 결제를 위한 회원이 가지고 있는 카드 리스트 제공
	 * 회원 포인트&쿠폰(2차) 조회
	 * @param reservationVO
	 * @return
	 */
	@RequestMapping("auth_reservation_{viewId}Result.do")
	public ModelAndView reservationResult(@PathVariable String viewId,ReservationVO reservationVO, MemberVO memberVO){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("sharing_"+viewId+"_result");
		if(viewId.equals("reservation")){
			reservationVO=reservationService.findReservationInfoByReservationNo(reservationVO.getReservationNo());
		}
		else{
			reservationVO=reservationService.findReturnInfoByReservationNo(reservationVO.getReservationNo());
		}
		List<MemberVO> cardList=memberService.findCardInfoByMemberId(memberVO.getMemberId());
		HashMap<String, Object> map=memberService.findPointAndCouponByMemberId(memberVO.getMemberId());
		mv.addObject(viewId+"Info", reservationVO);
		mv.addObject("cardListByMember",cardList);
		mv.addObject("PointAndCoupon",map);
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
	@RequestMapping("auth_reservation_cancelReservation.do")
	public String cancelReservation(ReservationVO reservationVO, String memberId){
		String sharingStatus=reservationVO.getSharingStatus();
		reservationService.cancelReservationByReservationNo(reservationVO);
		if(sharingStatus.equals("이용요금결제")){
			return "redirect:auth_payment_paymentCancel.do?reservationNo="+reservationVO.getReservationNo()+"&memberId="+memberId;
		}
		return "redirect:auth_member_reservationHistory.do";
	}
	/**
	 * 이용버튼 누르면 이용상태로 변경
	 * 미구현 >> 이용요금을 결제한 상태에서 이용시간이 되면 자동으로 이용상태로 변경
	 * @param reservationVO
	 * @return
	 */
	@RequestMapping("auth_reservation_usingSharingService.do")
	public String usingSharingService(ReservationVO reservationVO){
		reservationService.usingSharingService(reservationVO);
		return "redirect:auth_member_reservationHistory.do";
	}
	/**
	 * 이용차량 반납
	 * 주행거리 입력받아 반납 DB 에 등록되고 예약상태 DB 에 반납으로 변경
	 * @param reservationVO
	 * @param returnVO
	 * @return
	 */
	@RequestMapping("auth_reservation_returnSharingService.do")
	public String returnSharingService(ReservationVO reservationVO, ReturnVO returnVO){
		reservationVO.setReturnVO(returnVO);
		reservationService.returnSharingService(reservationVO);
		return "redirect:auth_member_reservationHistory.do";
	}
}
