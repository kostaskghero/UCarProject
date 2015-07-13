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
	/**
	 * 
	 */
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

	/**
	 * sharing_status Table 의 status 를 변경한다.
	 */
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

	/**
	 * sharing_status Table 에서 status 가 취소 or 완료가 아닌 reservationNo 의 정보를 sharing_reservation Table 에서 조회한다.
	 */
	@Override
	public List<ReservationVO> getAllSharingListExcludeCancel() {
		return sqlSessionTemplate.selectList("memberSharing.getAllSharingListExcludeCancel");
	}
	
	/**
	 * sharing_reservation Table 의 late_fee 와 late_time 을 변경한다.
	 */
	@Override
	public void updateLateFeeAndTime(ReservationVO reservationVO) {
		sqlSessionTemplate.update("memberSharing.updateLateFeeAndTime", reservationVO);
	}
}
