package ucar.sharing.payment.model;

import ucar.member.model.MemberVO;

public interface PaymentDAO {

	public String checkCardPassword(MemberVO memberVO);

	public void insertSharingPayment(PaymentVO paymentVO);

	public void updateReservationStatusAboutRentalPrice(PaymentVO paymentVO);

}
