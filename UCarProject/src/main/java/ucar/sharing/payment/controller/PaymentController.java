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
	 * 입력한 카드 비밀번호와 카드번호가 일치하는지 체크
	 * 일치하면 ok 를 일치하지 않으면 fail 을 반환
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
	 * @param paymentVO
	 * @return
	 */
	@RequestMapping("auth_payment_paymentRentalPrice.do")
	public String paymentRentalPrice(PaymentVO paymentVO){
		paymentService.paymentRentalPrice(paymentVO);
		return "redirect:auth_member_reservationHistory.do";
	}
	/**
	 * 주행요금 결제
	 * @param paymentVO
	 * @return
	 */
	@RequestMapping("auth_payment_paymentDrivingPrice.do")
	public String paymentDrivingPrice(PaymentVO paymentVO){
		paymentService.paymentDrivingPrice(paymentVO);
		return "redirect:auth_member_reservationHistory.do";
	}
}
