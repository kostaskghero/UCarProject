package ucar.sharing.payment.model;

import ucar.member.model.MemberVO;

public interface PaymentService {

	public String checkCardPassword(MemberVO memberVO);
	
	public void paymentRentalPrice(PaymentVO paymentVO, String memberId);

	public void paymentDrivingPriceSavingPoint(PaymentVO paymentVO, String memberId);

	public PaymentVO findPaymentInfoByReservationNo(int reservationNo);

	public void paymentRentalPriceCancel(PaymentVO paymentVO, String memberId);

}
