package ucar.sharing.reservation.model;


public interface ReservationDAO {

	public void reservationCar(ReservationVO reservationVO);

	public ReservationVO findReservationInfoByReservationNo(int reservationNo);

	public ReservationVO findReservationByMemberIdAndDate(ReservationVO reservationVO);

	public void changeSharingStatusByReservationNo(ReservationVO reservationVO);

	public void insertSharingStatus(int reservationNo);

	public void returnSharingService(ReservationVO reservationVO);

	public ReservationVO findReturnInfoByReservationNo(int reservationNo);

}
