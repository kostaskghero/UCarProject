package ucar.sharing.search.model;

import java.util.List;

import ucar.sharing.reservation.model.ReservationVO;

public interface SearchService {

	public List<ReservationVO> searchCar(ReservationVO reservationVO);

	public List<String> searchUCarZone(String term);

	public List<String> getAllCarModelList();

}
