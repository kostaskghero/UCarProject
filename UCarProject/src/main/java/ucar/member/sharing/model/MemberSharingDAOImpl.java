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
	 * sharing_reservation Table 에서 memberId 를 외래키로 가지면서
	 * status 가 예약, 이용요금 결제인 reservationNo 의 정보를 조회한다.
	 */
	@Override
	public List<ReservationVO> getReservationListByMemberId(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("memberSharing.getReservationListByMemberId", reservationVO);
	}

	/**
	 * sharing_reservation Table 에서 memberId 를 외래키로 가지면서
	 * status 가 이용중, 반납, 연체, 연장, 완료 인 reservationNo 의 정보를 조회한다.
	 */
	@Override
	public List<ReservationVO> getUsedListByMemberId(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("memberSharing.getUsedListByMemberId", reservationVO);
	}
	
	/**
	 * sharing_reservation Table 에서 memberId 를 외래키로 가지면서
	 * status 가 예약, 이용요금 결제인 reservationNo 의 수를 조회한다.
	 */
	@Override
	public int totalReservationByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("memberSharing.totalReservationByMemberId", memberId);
	}

	/**
	 * sharing_reservation Table 에서 memberId 를 외래키로 가지면서
	 * status 가 이용중, 반납, 연체, 연장, 완료 인 reservationNo 의 수를 조회한다.
	 */
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

	/**
	 * sharing_return Table 에 반납 정보가 삽입된다.
	 */
	@Override
	public void returnSharingService(ReservationVO reservationVO) {
		sqlSessionTemplate.insert("memberSharing.returnSharingService", reservationVO);
	}

	/**
	 * sharing_reservation Table 에서 reservationNo 의 carNo 의 예약 중
	 * 연장을 원하는 시간의 예약 정보를 조회한다.
	 */
	@Override
	public List<String> checkExtension(ReservationVO resrevationVO) {
		return sqlSessionTemplate.selectList("memberSharing.checkExtension", resrevationVO);
	}

	/**
	 * reservationNo 의 carNo 를 이용해 연장요금을 계산하여 조회한다.
	 */
	@Override
	public int calculateExtensionPrice(ReservationVO resrevationVO) {
		return sqlSessionTemplate.selectOne("memberSharing.calculateExtensionPrice", resrevationVO);
	}
	
	/**
	 * sharing_reservation Table 의 reservationNo 의 extensionTime 을 변경한다.
	 */
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
