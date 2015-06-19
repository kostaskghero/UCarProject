package ucar.sharing.reservation.model;

public interface ReservationService {

	public void reservationCar(ReservationVO reservationVO);

	public ReservationVO findReservationInfoByReservationNo(int reservationNo);

	public Object checkMemberReservation(ReservationVO reservationVO);

	public void cancelReservationByReservationNo(ReservationVO reservationVO);

	public void usingSharingService(ReservationVO reservationVO);

	public void returnSharingService(ReservationVO reservationVO);

	public ReservationVO findReturnInfoByReservationNo(int reservationNo);
}
