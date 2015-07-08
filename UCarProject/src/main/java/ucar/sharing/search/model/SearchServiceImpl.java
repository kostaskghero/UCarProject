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
	/**
	 * 검색조건에 부합하는 자동차 리스트를 반환
	 * carModel 의 값이 all 일 때, 유카존에 존재하는 모든 자동차 목록을 조회하고
	 * carModel 의 값이 all 이 아닐 때 유카존에 존재하면서 carModel 의 값과 일치하는 자동차 목록을 조회한다.
	 * carList 의 각 자동차의 옵션을 세팅하면서
	 * 조회된  carList  이용시간에 예약 되어 있는 목록인 scheduledCarList 를 비교해서
	 * carNo 가 일치하면 available 의 값을 false 로 세팅한다.
	 */
	@Override
	public List<ReservationVO> searchCar(ReservationVO reservationVO) {
		List<ReservationVO> carList=null;
		if(reservationVO.getCarVO().getCarModelInfoVO().getCarModel().equals("all")){
			carList=searchDAO.getAllCarListByUcarZoneName(reservationVO);
		} else{
			carList=searchDAO.getCarListByUcarZoneNameAndCarModel(reservationVO);
		}
		List<Integer> scheduledCarList=searchDAO.checkSchedule(reservationVO);	// 예약 진행할 수 없는 자동차 목록
		for(int i=0; i<carList.size(); i++){
			carList.get(i).setRentalDate(reservationVO.getRentalDate());
			carList.get(i).setReturnDate(reservationVO.getReturnDate());
			carList.get(i).getCarVO().getCarModelInfoVO().setCarOption(
					searchDAO.getAllCarOptionByCarModel(
							carList.get(i).getCarVO().getCarModelInfoVO().getCarModel()));
			for(int j=0; j<scheduledCarList.size(); j++){
				if(carList.get(i).getCarVO().getCarNo()==scheduledCarList.get(j)){
					carList.get(i).getCarVO().setAvailable(false);
				}
			}
		}
		return carList;
	}
	
	/**
	 * term 을 포함하는 모든 유카존을 반환한다.
	 */
	@Override
	public List<String> searchUCarZone(String term) {
		return searchDAO.searchUCarZone(term);
	}
	/**
	 * 등록된 자동차의 모델 종류를 목록으로 제공한다.
	 */
	@Override
	public List<String> getAllCarModelList() {
		return searchDAO.getAllCarModelList();
	}
	/**
	 * 등록된 모든 유카존의 정보를 UCarZoneVO 에 세팅해서 목록으로 제공한다.
	 */
	@Override
	public List<UCarZoneVO> getMapInfo() {
		return searchDAO.getMapInfo();
		
	}
}
