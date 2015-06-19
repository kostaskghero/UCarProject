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

	public List<ReservationVO> getAllReservationList() {
		return sqlSessionTemplate
				.selectList("adminSharing.getAllReservationList");
	}
	public List<ReservationVO> searchSharingByStatus (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByStatus",rvo);
	}
	public List<ReservationVO> searchSharingByCarNickName (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByCarNickName",rvo);
	}
	public List<ReservationVO> searchSharingByMemberId (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByMemberId",rvo);
	}
	public List<ReservationVO> searchSharingBySatausAndMemberId (ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingBySatausAndMemberId",rvo);
	}
	public List<ReservationVO> searchSharingBySatausAndCarNickName(ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingBySatausAndCarNickName",rvo);
	}
	public List<ReservationVO> searchSharingByCarNickNameAndMemberId(ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByCarNickNameAndMemberId",rvo);
	}
	public List<ReservationVO> searchSharingByCarNickNameAndMemberIdAndStataus(ReservationVO rvo){
		return sqlSessionTemplate.selectList("adminSharing.searchSharingByCarNickNameAndMemberIdAndStataus",rvo);
	}
}
