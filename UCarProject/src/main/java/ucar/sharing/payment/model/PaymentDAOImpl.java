package ucar.sharing.payment.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.member.model.MemberVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public String checkCardPassword(MemberVO memberVO) {
		int count=sqlSessionTemplate.selectOne("payment.checkCardPassword", memberVO);
		return (count==1)? "ok":"fail";
	}

	@Override
	public void insertSharingPayment(PaymentVO paymentVO) {
		sqlSessionTemplate.insert("payment.insertSharingPayment", paymentVO);
	}

	@Override
	public void updateReservationStatusAboutRentalPrice(PaymentVO paymentVO) {
		sqlSessionTemplate.update("payment.updateReservationStatusAboutRentalPrice", paymentVO);
	}
}
