package ucar.sharing.search.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ucar.car.model.UCarZoneVO;
import ucar.sharing.reservation.model.ReservationVO;

@Service
public class SearchServiceImpl implements SearchService {
	@Resource
	private SearchDAO searchDAO;

	@Override
	public List<ReservationVO> searchCar(ReservationVO reservationVO) {
		List<ReservationVO> carList=null;
		if(reservationVO.getCarVO().getCarModelInfoVO().getCarModel().equals("all")){
			carList=searchDAO.getAllCarListByUcarZoneName(reservationVO);
		} else{
			carList=searchDAO.getCarListByUcarZoneNameAndCarModel(reservationVO);
		}
		List<Integer> scheduledCarList=searchDAO.checkSchedule(reservationVO);
		for(int i=0; i<carList.size(); i++){
			carList.get(i).setRentalDate(reservationVO.getRentalDate());
			carList.get(i).setReturnDate(reservationVO.getReturnDate());
			carList.get(i).getCarVO().getCarModelInfoVO().setCarOption(searchDAO.getAllCarOptionByCarModel(carList.get(i).getCarVO().getCarModelInfoVO().getCarModel()));
			for(int j=0; j<scheduledCarList.size(); j++){
				if(carList.get(i).getCarVO().getCarNo()==scheduledCarList.get(j)){
					carList.get(i).getCarVO().setAvailable(false);
				}
			}
		}
		return carList;
	}

	@Override
	public List<String> searchUCarZone(String term) {
		return searchDAO.searchUCarZone(term);
	}

	@Override
	public List<String> getAllCarModelList() {
		return searchDAO.getAllCarModelList();
	}

	@Override
	public List<UCarZoneVO> getMapInfo() {
		return searchDAO.getMapInfo();
		
	}
}
