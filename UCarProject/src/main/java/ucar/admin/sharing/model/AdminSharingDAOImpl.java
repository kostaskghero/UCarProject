package ucar.admin.sharing.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.sharing.reservation.model.ReservationVO;

@Repository
public class AdminSharingDAOImpl implements AdminSharingDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 예약테이블의 모든 튜플을 가져온다.
	 */
	public List<ReservationVO> getAllReservationList() {
		return sqlSessionTemplate
				.selectList("adminSharing.getAllReservationList");
	}
	/**
	 * 예약상태로 예약테이블을 검색한다 
	 */
	public List<ReservationVO> searchSharingByStatus (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByStatus",rvo);
	}
	/**
	 * 차량 닉네임으로 예약테이블을 검색한다.
	 */
	public List<ReservationVO> searchSharingByCarNickName (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByCarNickName",rvo);
	}
	/**
	 * 회원아이디로 예약내역을 검색한다.
	 */
	public List<ReservationVO> searchSharingByMemberId (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByMemberId",rvo);
	}
	/**
	 * 예약상태와 회원아이디로 예약내역을 검색한다.
	 */
	public List<ReservationVO> searchSharingBySatausAndMemberId (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingBySatausAndMemberId",rvo);
	}
	/**
	 * 예약 상태와 차량 닉네임으로 예약내역을 검색한다.
	 */
	public List<ReservationVO> searchSharingBySatausAndCarNickName(ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingBySatausAndCarNickName",rvo);
	}
	/**
	 * 차량닉네임과 회원아이디로  예약내역을 검색한다.
	 */
	public List<ReservationVO> searchSharingByCarNickNameAndMemberId(ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByCarNickNameAndMemberId",rvo);
	}
	/**
	 * 예약상태, 차량닉네임, 회원아디로 예약내역을 검색한다.
	 */
	public List<ReservationVO> searchSharingByCarNickNameAndMemberIdAndStataus(ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByCarNickNameAndMemberIdAndStataus",rvo);
	}
}
