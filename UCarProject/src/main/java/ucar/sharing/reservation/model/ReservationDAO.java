package ucar.sharing.reservation.model;



public interface ReservationDAO {

	public void reservationCar(ReservationVO reservationVO);

	public ReservationVO findReservationInfoByReservationNo(int reservationNo);

	public ReservationVO findReservationByMemberIdAndDate(ReservationVO reservationVO);

	public void insertSharingStatus(int reservationNo);

	public ReservationVO findReturnInfoByReservationNo(int reservationNo);

	public ReservationVO findExtensionInfoByReservationNo(int reservationNo);

	public int findReservationByMemberId(String memberId);

}
