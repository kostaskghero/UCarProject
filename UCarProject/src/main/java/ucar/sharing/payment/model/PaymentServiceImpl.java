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
	public void paymentRentalPriceSavingPoint(PaymentVO paymentVO) {
		if(paymentVO.getUsingPoint()>0){
			// 사용하는 포인트만큼 회원의 포인트 차감
		}
		// 결제금액에 해당하는 포인트 지급(aop)
		paymentDAO.insertSharingPayment(paymentVO);
		paymentDAO.updateReservationStatusAboutRentalPrice(paymentVO);
	}
}
