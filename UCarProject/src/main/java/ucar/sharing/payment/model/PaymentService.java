package ucar.sharing.payment.model;

import ucar.member.model.MemberVO;

public interface PaymentService {

	public String checkCardPassword(MemberVO memberVO);
	
	public void paymentRentalPrice(PaymentVO paymentVO);

	public void paymentDrivingPrice(PaymentVO paymentVO);

}
