package ucar.sharing.payment.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ucar.member.model.CardVO;
import ucar.member.model.MemberVO;
import ucar.sharing.payment.model.PaymentService;
import ucar.sharing.payment.model.PaymentVO;

@Controller
public class PaymentController {
	@Resource
	private PaymentService paymentService;
	
	/**
	 * 결제카드 비밀번호 확인
	 * 입력한 카드 비밀번호와 카드번호가 일치하는지 체크한다.
	 * 일치하면 ok 를 일치하지 않으면 fail 을 반환한다.
	 * @param memberVO
	 * @param cardVO
	 * @return
	 */
	@RequestMapping("auth_payment_checkCardPassword.do")
	@ResponseBody
	public String checkCardPassword(MemberVO memberVO, CardVO cardVO){
		memberVO.setCardVO(cardVO);
		return paymentService.checkCardPassword(memberVO);
	}
	/**
	 * 이용요금 결제
	 * 이용요금을 결제하고 결제내역을 기록한다.
	 * @param paymentVO
	 * @return
	 */
	@RequestMapping("auth_payment_paymentRentalPrice.do")
	public String paymentRentalPrice(PaymentVO paymentVO, String memberId){
		paymentService.paymentRentalPrice(paymentVO, memberId);
		return "redirect:auth_memberSharing_reservationHistory.do";
	}
	/**
	 * 주행요금 결제
	 * 주행요금을 결제하고 결제내역을 기록한다.
	 * @param paymentVO
	 * @return
	 */
	@RequestMapping("auth_payment_paymentDrivingPrice.do")
	public String paymentDrivingPrice(PaymentVO paymentVO, String memberId){
		paymentService.paymentDrivingPriceSavingPoint(paymentVO, memberId);
		return "redirect:auth_memberSharing_reservationHistory.do";
	}
	
	/**
	 * 결제취소
	 * 이용요금을 결제한 상태에서 예약을 취소하면 결제를 취소하고 결제 시 사용한 포인트가 있을 경우 되돌려준다.
	 * @param paymentVO
	 * @param memberId
	 * @return
	 */
	@RequestMapping("auth_payment_paymentCancel.do")
	public String paymentRentalPriceCancel(PaymentVO paymentVO, String memberId){
		paymentVO=paymentService.findPaymentInfoByReservationNo(paymentVO.getReservationNo());
		paymentService.paymentRentalPriceCancel(paymentVO, memberId);
		return "redirect:auth_memberSharing_reservationHistory.do";
	}
}
