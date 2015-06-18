package ucar.sharing.reservation.model;

public interface ReservationService {

	public void reservationCar(ReservationVO reservationVO);

	public ReservationVO findReservationInfoByReservationNo(int reservationNo);

	public Object checkMemberReservation(ReservationVO reservationVO);

	public ReservationListVO getReservationListByMemberId(String memberId, String pageNo);

	public ReservationListVO getUsedListByMemberId(String memberId, String pageNo);

	public void cancelReservationByReservationNo(int reservationNo);
}
