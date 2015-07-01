package ucar.sharing.search.model;
import java.util.List;

import ucar.car.model.UCarZoneVO;
import ucar.sharing.reservation.model.ReservationVO;

public interface SearchDAO {

	public List<ReservationVO> getAllCarListByUcarZoneName(ReservationVO reservationVO);

	public List<ReservationVO> getCarListByUcarZoneNameAndCarModel(ReservationVO reservationVO);

	public List<Integer> checkSchedule(ReservationVO reservationVO);

	public List<String> searchUCarZone(String term);

	public List<String> getAllCarModelList();

	public List<UCarZoneVO> getMapInfo();

	public List<String> getAllCarOptionByCarModel(String carModel);

}
