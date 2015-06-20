package ucar.sharing.payment.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.member.model.MemberVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Resource
	private PaymentDAO paymentDAO;

	@Override
	public String checkCardPassword(MemberVO memberVO) {
		return paymentDAO.checkCardPassword(memberVO);
	}
	
	@Transactional
	@Override
	public void paymentRentalPrice(PaymentVO paymentVO, String memberId) {
		paymentVO.setPaymentStatus("완료");
		paymentDAO.insertSharingPayment(paymentVO);
		paymentDAO.updateSharingStatusAboutRentalPrice(paymentVO);
	}
	@Transactional
	@Override
	public void paymentDrivingPriceSavingPoint(PaymentVO paymentVO, String memberId) {
		paymentVO.setPaymentStatus("완료");
		paymentDAO.insertSharingPayment(paymentVO);
		paymentDAO.updateSharingStatusAboutDrivingPrice(paymentVO);
	}

	@Override
	public PaymentVO findPaymentInfoByReservationNo(int reservationNo) {
		return paymentDAO.findPaymentInfoByReservationNo(reservationNo);
	}
	@Transactional
	@Override
	public void paymentRentalPriceCancel(PaymentVO paymentVO, String memberId) {
		paymentVO.setPaymentStatus("취소");
		paymentDAO.insertSharingPayment(paymentVO);
	}
}
