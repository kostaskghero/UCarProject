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
	 * 회원이 예약을 진행할 수 있는지 확인
	 * 1. 회원의 운전면허 정보가 있는가
	 * 2. 이용을 원하는 시간에 회원이 다른 차를 예약했는가
	 * 3. 이용완료 되지 않은 내역이 남아있는가
	 * 확인 결과를 반환한다.
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
	 * 선택한 정보를 예약 DB 에 입력한다. insert 는 한번만 되도록 redirect 한다.
	 * @param reservationVO
	 * @param carVO
	 * @param memberVO
	 * @return
	 */
	@RequestMapping("auth_reservation_reservationCar.do")
	public String reservationCar(ReservationVO reservationVO, CarVO carVO, MemberVO memberVO){
		reservationVO.setCarVO(carVO);
		reservationVO.setMemberVO(memberVO);
		reservationService.reservationCar(reservationVO);
		return "redirect:auth_reservation_reservationResult.do?reservationNo="+reservationVO.getReservationNo()+"&memberId="+memberVO.getMemberId();
	}
	
	/**
	 * 예약, 반납결과
	 * 
	 * 1. viewId == 'reservation'
	 * 	예약 결과를 제공한다.
	 * 
	 * 2. viewId == 'return'
	 * 	반납 결과를 제공한다.
	 * 
	 * 결제를 위해 회원이 가지고 있는 결제 카드 목록과 보유한 포인트를 제공한다.
	 * @param reservationVO
	 * @return
	 */
	@RequestMapping("auth_reservation_{viewId}Result.do")
	public ModelAndView reservationAndReturnResult(@PathVariable String viewId,
			ReservationVO reservationVO, MemberVO memberVO){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("sharing_"+viewId+"_result");
		if(viewId.equals("reservation")){
			reservationVO=reservationService.
					findReservationInfoByReservationNo(reservationVO.getReservationNo());
		}
		else{
			reservationVO=reservationService.findReturnInfoByReservationNo(reservationVO);
		}
		mv.addObject(viewId+"Info", reservationVO);
		mv.addObject("cardListByMember",
				memberService.findCardInfoByMemberId(memberVO.getMemberId()));
		mv.addObject("memberPoint",
				memberService.findPointByMemberId(memberVO.getMemberId()));
		return mv;
	}
}
