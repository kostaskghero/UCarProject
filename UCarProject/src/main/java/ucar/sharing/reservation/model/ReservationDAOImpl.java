package ucar.sharing.reservation.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void reservationCar(ReservationVO reservationVO) {
		sqlSessionTemplate.insert("reservation.reservationCar", reservationVO);
	}

	@Override
	public ReservationVO findReservationInfoByReservationNo(int reservationNo) {
		return sqlSessionTemplate.selectOne("reservation.findReservationInfoByReservationNo", reservationNo);
	}

	@Override
	public ReservationVO findReservationByMemberIdAndDate(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectOne("reservation.findReservationByMemberIdAndDate", reservationVO);
	}

	@Override
	public int totalReservationByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("reservation.totalReservationByMemberId", memberId);
	}

	@Override
	public List<ReservationVO> getReservationListByMemberId(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("reservation.getReservationListByMemberId", reservationVO);
	}

	@Override
	public List<ReservationVO> getUsedListByMemberId(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("reservation.getUsedListByMemberId", reservationVO);
	}

	@Override
	public int totalUsedByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("reservation.totalUsedByMemberId", memberId);
	}

	@Override
	public void cancelReservationByReservationNo(int reservationNo) {
		sqlSessionTemplate.update("reservation.cancelReservationByReservationNo", reservationNo);
	}

	@Override
	public void insertSharingStatus(int reservationNo) {
		sqlSessionTemplate.insert("reservation.insertSharingStatus", reservationNo);
	}
}
