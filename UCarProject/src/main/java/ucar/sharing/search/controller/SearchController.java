package ucar.sharing.search.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.car.model.CarModelInfoVO;
import ucar.car.model.CarVO;
import ucar.car.model.UCarZoneVO;
import ucar.sharing.reservation.model.ReservationVO;
import ucar.sharing.search.model.SearchService;

@Controller
public class SearchController {
	@Resource
	private SearchService searchService;
	/**
	 * 차량검색폼으로 이동
	 * 차종리스트를 반환한다.
	 * @return
	 */
	@RequestMapping("search_searchForm.do")
	public ModelAndView searchForm(){
		return new ModelAndView("sharing_search_form", "carModelList", searchService.getAllCarModelList());
	}
	/**
	 * searchVO 의 ucarZoneName 에 해당하는 모든 carList 를 리턴
	 * 이용을 원하는 시간에 예약이 되어있는 차량의 리스트는 checkAvailable method 에서 리턴받아
	 * 예약가능한지 아닌지 표시한다.  
	 * @param searchVO
	 * @return
	 */
	@RequestMapping("search_searchCar.do")
	@ResponseBody
	public List<ReservationVO> searchCar(ReservationVO reservationVO, CarVO carVO, CarModelInfoVO carModelInfoVO, UCarZoneVO uCarZoneVO){
		carVO.setuCarZoneVO(uCarZoneVO);
		carVO.setCarModelInfoVO(carModelInfoVO);
		reservationVO.setCarVO(carVO);
		return searchService.searchCar(reservationVO);
	}
	
	@RequestMapping("search_searchUCarZone.do")
	@ResponseBody
	public List<String> searchUCarZone(String term){
		return searchService.searchUCarZone(term);
	}
}
