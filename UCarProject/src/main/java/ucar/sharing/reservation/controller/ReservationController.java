package ucar.sharing.reservation.controller;

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
			reservationVO=reservationService.findReturnInfoByReservationNo(reservationVO);
		}
		List<MemberVO> cardList=memberService.findCardInfoByMemberId(memberVO.getMemberId());
		mv.addObject("cardListByMember",cardList);
		mv.addObject("memberPoint",memberService.findPointByMemberId(memberVO.getMemberId()));
		return mv;
	}
}
