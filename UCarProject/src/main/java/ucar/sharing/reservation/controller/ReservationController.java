package ucar.sharing.reservation.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.car.model.CarVO;
import ucar.member.model.MemberService;
import ucar.member.model.MemberVO;
import ucar.sharing.reservation.model.ReservationListVO;
import ucar.sharing.reservation.model.ReservationService;
import ucar.sharing.reservation.model.ReservationVO;

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
		return "redirect:auth_reservation_reservation_result.do?reservationNo="+reservationVO.getReservationNo()+"&memberId="+memberVO.getMemberId();
	}
	/**
	 * 예약한 내역을 제공
	 * 결제를 위한 회원이 가지고 있는 카드 리스트 제공
	 * 회원 포인트&쿠폰(2차) 조회
	 * @param reservationVO
	 * @return
	 */
	@RequestMapping("auth_reservation_reservation_result.do")
	public ModelAndView reservationResult(ReservationVO reservationVO, MemberVO memberVO){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("sharing_reservation_result");
		reservationVO=reservationService.findReservationInfoByReservationNo(reservationVO.getReservationNo());
		List<MemberVO> cardList=memberService.findCardInfoByMemberId(memberVO.getMemberId());
		HashMap<String, Object> map=memberService.findPointAndCouponByMemberId(memberVO.getMemberId());
		mv.addObject("reservationInfo", reservationVO);
		mv.addObject("cardListByMember",cardList);
		mv.addObject("PointAndCoupon",map);
		return mv;
	}
	/**
	 * 회원의 예약/이용내역을 List 로 제공
	 * @param request
	 * @return
	 */
	@RequestMapping("auth_member_reservationHistory.do")
	public ModelAndView reservationHistory(HttpServletRequest request, String pageNo){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("member_reservationHistory");
		HttpSession session=request.getSession(false);
		MemberVO memberVO=(MemberVO)session.getAttribute("loginInfo");
		ReservationListVO reservationListVO=reservationService.getReservationListByMemberId(memberVO.getMemberId(), pageNo);
		mv.addObject("reservationList", reservationListVO);
		ReservationListVO usedListVO=reservationService.getUsedListByMemberId(memberVO.getMemberId(), pageNo);
		mv.addObject("usedList", usedListVO);
		return mv;
	}
	/**
	 * 예약상태인 차량을 취소
	 * 예약취소하면 DB 에는 기록이 남고 회원은 볼 수 없다
	 * 이용요금을 결제한 상태에서 취소한 경우
	 * 아직 미구현 >>	포인트 사용했으면 사용한 포인트 지급, 결제로 쌓은 포인트 반환
	 * 					포인트 사용하지 않았으면 결제로 쌓은 포인트 반환 
	 * @param reservationVO
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("auth_reservation_cancelReservation.do")
	public String cancelReservation(ReservationVO reservationVO, String pageNo){
		reservationService.cancelReservationByReservationNo(reservationVO.getReservationNo());
		return "redirect:auth_member_reservationHistory.do?pageNo="+pageNo;
	}
}
