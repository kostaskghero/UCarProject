package ucar.admin.sharing.model;

import java.util.List;

import ucar.sharing.reservation.model.ReservationVO;

public interface AdminSharingDAO {
	public List<ReservationVO> getAllReservationList();
	public List<ReservationVO> searchSharingByStatus (ReservationVO rvo);
	public List<ReservationVO> searchSharingByCarNickName (ReservationVO rvo);
	public List<ReservationVO> searchSharingByMemberId (ReservationVO rvo);
	public List<ReservationVO> searchSharingBySatausAndMemberId (ReservationVO rvo);
	public List<ReservationVO> searchSharingBySatausAndCarNickName(ReservationVO rvo);
	public List<ReservationVO> searchSharingByCarNickNameAndMemberId(ReservationVO rvo);
	public List<ReservationVO> searchSharingByCarNickNameAndMemberIdAndStataus(ReservationVO rvo);
}
