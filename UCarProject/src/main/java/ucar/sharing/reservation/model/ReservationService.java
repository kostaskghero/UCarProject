package ucar.sharing.reservation.model;


public interface ReservationService {

	public void reservationCar(ReservationVO reservationVO);

	public ReservationVO findReservationInfoByReservationNo(int reservationNo);

	public Object checkMemberReservation(ReservationVO reservationVO);

	public ReservationVO findReturnInfoByReservationNo(ReservationVO reservationVO);
}
