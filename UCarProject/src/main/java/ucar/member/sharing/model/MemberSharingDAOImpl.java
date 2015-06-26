package ucar.member.sharing.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.sharing.reservation.model.ReservationVO;

@Repository
public class MemberSharingDAOImpl implements MemberSharingDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ReservationVO> getReservationListByMemberId(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("memberSharing.getReservationListByMemberId", reservationVO);
	}

	@Override
	public List<ReservationVO> getUsedListByMemberId(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("memberSharing.getUsedListByMemberId", reservationVO);
	}
	
	@Override
	public int totalReservationByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("memberSharing.totalReservationByMemberId", memberId);
	}

	@Override
	public int totalUsedByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("memberSharing.totalUsedByMemberId", memberId);
	}


	@Override
	public void changeSharingStatusByReservationNo(ReservationVO reservationVO) {
		sqlSessionTemplate.update("memberSharing.changeSharingStatusByReservationNo", reservationVO);
	}


	@Override
	public void returnSharingService(ReservationVO reservationVO) {
		sqlSessionTemplate.insert("memberSharing.returnSharingService", reservationVO);
	}


	@Override
	public List<String> checkExtension(ReservationVO resrevationVO) {
		return sqlSessionTemplate.selectList("memberSharing.checkExtension", resrevationVO);
	}

	@Override
	public int calculateExtensionPrice(ReservationVO resrevationVO) {
		return sqlSessionTemplate.selectOne("memberSharing.calculateExtensionPrice", resrevationVO);
	}

	@Override
	public void extensionReservation(ReservationVO reservationVO) {
		sqlSessionTemplate.update("memberSharing.extensionReservation", reservationVO);
	}

	@Override
	public List<ReservationVO> getAllSharingListExcludeCancel() {
		return sqlSessionTemplate.selectList("memberSharing.getAllSharingListExcludeCancel");
	}

	@Override
	public void updateLateFeeAndTime(ReservationVO reservationVO) {
		sqlSessionTemplate.update("memberSharing.updateLateFeeAndTime", reservationVO);
	}
}
