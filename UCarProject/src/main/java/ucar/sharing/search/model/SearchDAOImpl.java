package ucar.sharing.search.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.car.model.UCarZoneVO;
import ucar.sharing.reservation.model.ReservationVO;

@Repository
public class SearchDAOImpl implements SearchDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * uCarZoneName 에 존재하는 모든 자동차의 자동차 정보와 요금 정보를 조회한다.
	 */
	@Override
	public List<ReservationVO> getAllCarListByUcarZoneName(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("search.getAllCarListByUcarZoneName", reservationVO);
	}
	
	/**
	 * uCarZoneName 에 존재하면서 모델명이 carModel 인 자동차 정보와 요금 정보를 조회한다.
	 */
	@Override
	public List<ReservationVO> getCarListByUcarZoneNameAndCarModel(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("search.getCarListByUcarZoneNameAndCarModel", reservationVO);
	}
	
	/**
	 * sharing_reservation Table 에 있는 정보 중 rentalDate ~ returnDate 에 예약을 진행할 수 없는 CarNo 를 조회한다.
	 */
	@Override
	public List<Integer> checkSchedule(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("search.checkSchedule", reservationVO);
	}
	
	/**
	 * term 을 포함하는 모든 유카존을 반환한다.
	 */
	@Override
	public List<String> searchUCarZone(String term) {
		return sqlSessionTemplate.selectList("search.searchUCarZone", term);
	}
	/**
	 * car_model_info Table 의 carModel 종류를 조회한다.
	 */
	@Override
	public List<String> getAllCarModelList() {
		return sqlSessionTemplate.selectList("search.getAllCarModelList");
	}
	
	/**
	 * ucar_zone Table 의 모든 정보를 조회한다.
	 */
	@Override
	public List<UCarZoneVO> getMapInfo() {
		return sqlSessionTemplate.selectList("ucarzone.getAllUCarZoneList");
	}
	
	/**
	 * carModel 에 해당하는 자동차 옵션을 조회한다.
	 */
	@Override
	public List<String> getAllCarOptionByCarModel(String carModel) {
		return sqlSessionTemplate.selectList("search.getAllCarOptionByCarModel", carModel);
	}
}
