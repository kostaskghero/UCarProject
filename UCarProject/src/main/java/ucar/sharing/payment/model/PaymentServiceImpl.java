package ucar.sharing.payment.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.member.model.MemberVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Resource
	private PaymentDAO paymentDAO;
	
	/**
	 * 회원의 결제카드 비밀번호를 확인한다.
	 */
	@Override
	public String checkCardPassword(MemberVO memberVO) {
		return paymentDAO.checkCardPassword(memberVO);
	}
	
	/**
	 * 이용요금결제 내역을 DB 에 남기고 예약 상태를 변경한다.
	 */
	@Transactional
	@Override
	public void paymentRentalPrice(PaymentVO paymentVO, String memberId) {
		paymentVO.setPaymentStatus("완료");
		paymentDAO.insertSharingPayment(paymentVO);
		paymentDAO.updateSharingStatusAboutRentalPrice(paymentVO);
	}
	
	/**
	 * 주행요금결제 내역을 DB 에 남기고 예약 상태를 변경한다.
	 */
	@Transactional
	@Override
	public void paymentDrivingPriceSavingPoint(PaymentVO paymentVO, String memberId) {
		paymentVO.setPaymentStatus("완료");
		paymentDAO.insertSharingPayment(paymentVO);
		paymentDAO.updateSharingStatusAboutDrivingPrice(paymentVO);
	}
	
	/**
	 * reservationNo 에 대한 결제 정보를 조회한다.
	 */
	@Override
	public PaymentVO findPaymentInfoByReservationNo(int reservationNo) {
		return paymentDAO.findPaymentInfoByReservationNo(reservationNo);
	}
	
	/**
	 * 결제 취소 내역을 DB 에 남긴다.
	 */
	@Transactional
	@Override
	public void paymentRentalPriceCancel(PaymentVO paymentVO, String memberId) {
		paymentVO.setPaymentStatus("취소");
		paymentDAO.insertSharingPayment(paymentVO);
	}
}
