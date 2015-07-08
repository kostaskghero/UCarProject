package ucar.sharing.payment.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.member.model.MemberVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 입력한 정보와 일치하는 DB 정보가 존재하는지 조회한다.
	 * 존재하면 ok 를 반환하고, 그렇지 않으면 fail 을 반환한다.
	 */
	@Override
	public String checkCardPassword(MemberVO memberVO) {
		int count=sqlSessionTemplate.selectOne("payment.checkCardPassword", memberVO);
		return (count==1)? "ok":"fail";
	}
	
	/**
	 * sharing_payment Table 에 결제 정보를 삽입한다.
	 */
	@Override
	public void insertSharingPayment(PaymentVO paymentVO) {
		sqlSessionTemplate.insert("payment.insertSharingPayment", paymentVO);
	}
	
	/**
	 * sharing_status Table 의 상태를 '이용요금결제' 로 변경한다.
	 */
	@Override
	public void updateSharingStatusAboutRentalPrice(PaymentVO paymentVO) {
		sqlSessionTemplate.update("payment.updateSharingStatusAboutRentalPrice", paymentVO);
	}
	
	/**
	 * sharing_status Table 의 상태를 '완료' 로 변경한다.
	 */
	@Override
	public void updateSharingStatusAboutDrivingPrice(PaymentVO paymentVO) {
		sqlSessionTemplate.update("payment.updateSharingStatusAboutDrivingPrice", paymentVO);
	}
	
	/**
	 * sharing_payment Table 에서 reservationNo 에 대한 결제정보를 조회한다.
	 */
	@Override
	public PaymentVO findPaymentInfoByReservationNo(int reservationNo) {
		return sqlSessionTemplate.selectOne("payment.findPaymentInfoByReservationNo", reservationNo);
	}
}
