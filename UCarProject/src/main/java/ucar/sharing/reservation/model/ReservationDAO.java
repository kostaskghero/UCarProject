package ucar.sharing.reservation.model;

import java.util.List;

public interface ReservationDAO {

	public void reservationCar(ReservationVO reservationVO);

	public ReservationVO findReservationInfoByReservationNo(int reservationNo);

	public ReservationVO findReservationByMemberIdAndDate(ReservationVO reservationVO);

	public int totalReservationByMemberId(String memberId);

	public List<ReservationVO> getReservationListByMemberId(ReservationVO reservationVO);

	public List<ReservationVO> getUsedListByMemberId(ReservationVO reservationVO);

	public int totalUsedByMemberId(String memberId);

	public void cancelReservationByReservationNo(int reservationNo);

	public void insertSharingStatus(int reservationNo);

}
