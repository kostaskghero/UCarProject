package ucar.sharing.reservation.model;

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
	public void changeSharingStatusByReservationNo(ReservationVO reservationVO) {
		sqlSessionTemplate.update("reservation.changeSharingStatusByReservationNo", reservationVO);
	}

	@Override
	public void insertSharingStatus(int reservationNo) {
		sqlSessionTemplate.insert("reservation.insertSharingStatus", reservationNo);
	}

	@Override
	public void returnSharingService(ReservationVO reservationVO) {
		sqlSessionTemplate.insert("reservation.returnSharingService", reservationVO);
	}

	@Override
	public ReservationVO findReturnInfoByReservationNo(int reservationNo) {
		return sqlSessionTemplate.selectOne("reservation.findReturnInfoByReservationNo", reservationNo);
	}
}
