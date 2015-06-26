package ucar.member.sharing.model;

import java.util.List;

import ucar.sharing.reservation.model.ReservationVO;

public interface MemberSharingDAO {
	public List<ReservationVO> getReservationListByMemberId(ReservationVO reservationVO);

	public List<ReservationVO> getUsedListByMemberId(ReservationVO reservationVO);

	public int totalReservationByMemberId(String memberId);

	public int totalUsedByMemberId(String memberId);
	
	public void changeSharingStatusByReservationNo(ReservationVO reservationVO);

	public void returnSharingService(ReservationVO reservationVO);

	public List<String> checkExtension(ReservationVO resrevationVO);

	public int calculateExtensionPrice(ReservationVO resrevationVO);

	public void extensionReservation(ReservationVO reservationVO);

	public List<ReservationVO> getAllSharingListExcludeCancel();

	public void updateLateFeeAndTime(ReservationVO reservationVO);
}
