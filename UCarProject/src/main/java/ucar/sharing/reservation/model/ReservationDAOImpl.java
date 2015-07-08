package ucar.sharing.reservation.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 예약 정보를 sharing_reservation Table 에 삽입한다.
	 */
	@Override
	public void reservationCar(ReservationVO reservationVO) {
		sqlSessionTemplate.insert("reservation.reservationCar", reservationVO);
	}
	
	/**
	 * 예약 번호에 해당하는 예약 정보를 조회한다.
	 */
	@Override
	public ReservationVO findReservationInfoByReservationNo(int reservationNo) {
		return sqlSessionTemplate.selectOne("reservation.findReservationInfoByReservationNo", reservationNo);
	}
	
	/**
	 * 회원의 예약내역 중 이용시간이 rentalDate ~ returnDate 인 예약 정보를 조회한다. 
	 */
	@Override
	public ReservationVO findReservationByMemberIdAndDate(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectOne("reservation.findReservationByMemberIdAndDate", reservationVO);
	}
	
	/**
	 * sharing_status Table 에 예약번호를 외래키로 '예약' 상태를 삽입한다.
	 */
	@Override
	public void insertSharingStatus(int reservationNo) {
		sqlSessionTemplate.insert("reservation.insertSharingStatus", reservationNo);
	}
	
	/**
	 * 예약번호에 해당하는 반납 정보를 조회한다.
	 */
	@Override
	public ReservationVO findReturnInfoByReservationNo(int reservationNo) {
		return sqlSessionTemplate.selectOne("reservation.findReturnInfoByReservationNo", reservationNo);
	}
	
	/**
	 * 예약번호에 해당하는 반납 정보와 연장 정보를 함께 조회한다. 
	 */
	@Override
	public ReservationVO findExtensionInfoByReservationNo(int reservationNo) {
		return sqlSessionTemplate.selectOne("reservation.findExtensionInfoByReservationNo", reservationNo);
	}
	
	/**
	 * 회원의 서비스이용내역 중 이용이 완료되지 않은 내역의 수를 조회한다.
	 */
	@Override
	public int findReservationByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("reservation.findReservationByMemberId", memberId);
	}
}
