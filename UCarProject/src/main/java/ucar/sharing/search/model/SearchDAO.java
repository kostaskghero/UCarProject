package ucar.sharing.search.model;

import java.util.List;

import ucar.sharing.reservation.model.ReservationVO;

public interface SearchDAO {

	List<ReservationVO> getAllCarListByUcarZoneName(ReservationVO reservationVO);

	List<ReservationVO> getCarListByUcarZoneNameAndCarModel(ReservationVO reservationVO);

	List<Integer> checkSchedule(ReservationVO reservationVO);

}
