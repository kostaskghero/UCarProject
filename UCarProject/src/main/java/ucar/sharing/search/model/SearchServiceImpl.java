package ucar.sharing.search.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ucar.sharing.reservation.model.ReservationVO;

@Service
public class SearchServiceImpl implements SearchService {
	@Resource
	private SearchDAO reservationDAO;

	@Override
	public List<ReservationVO> searchCar(ReservationVO reservationVO) {
		List<ReservationVO> carList=null;
		if(reservationVO.getCarVO().getCarModelInfoVO().getCarModel().equals("all")){
			carList=reservationDAO.getAllCarListByUcarZoneName(reservationVO);
		} else{
			carList=reservationDAO.getCarListByUcarZoneNameAndCarModel(reservationVO);
		}
		List<Integer> scheduledCarList=reservationDAO.checkSchedule(reservationVO);
		for(int i=0; i<carList.size(); i++){
			carList.get(i).setRentalDate(reservationVO.getRentalDate());
			carList.get(i).setReturnDate(reservationVO.getReturnDate());
			for(int j=0; j<scheduledCarList.size(); j++){
				if(carList.get(i).getCarVO().getCarNo()==scheduledCarList.get(j)){
					carList.get(i).getCarVO().setAvailable(false);
				}
			}
		}
		return carList;
	}
}
