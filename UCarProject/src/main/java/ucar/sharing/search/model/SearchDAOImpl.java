package ucar.sharing.search.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.sharing.reservation.model.ReservationVO;

@Repository
public class SearchDAOImpl implements SearchDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ReservationVO> getAllCarListByUcarZoneName(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("search.getAllCarListByUcarZoneName", reservationVO);
	}

	@Override
	public List<ReservationVO> getCarListByUcarZoneNameAndCarModel(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("search.getCarListByUcarZoneNameAndCarModel", reservationVO);
	}

	@Override
	public List<Integer> checkSchedule(ReservationVO reservationVO) {
		return sqlSessionTemplate.selectList("search.checkSchedule", reservationVO);
	}

	@Override
	public List<String> searchUCarZone(String term) {
		return sqlSessionTemplate.selectList("search.searchUCarZone", term);
	}

	@Override
	public List<String> getAllCarModelList() {
		return sqlSessionTemplate.selectList("search.getAllCarModelList");
	}
}
