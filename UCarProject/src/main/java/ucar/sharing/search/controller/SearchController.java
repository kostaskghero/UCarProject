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
	@Resource(name = "uploadCarPicPath")
	private String uploadCarPicPath;
	@Resource(name = "viewCarPath")
	private String viewCarPath;
	
	/**
	 * 쉐어링 검색 폼
	 * 
	 * @return
	 */
	@RequestMapping("search_searchForm.do")
	public ModelAndView searchForm(ReservationVO reservationVO, CarVO carVO, CarModelInfoVO carModelInfoVO, UCarZoneVO uCarZoneVO){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("sharing_search_form");
		mv.addObject("carModelList", searchService.getAllCarModelList());
		mv.addObject("ucarZoneList", searchService.getMapInfo());
		if(reservationVO.getRentalDate()!=null){
			carVO.setuCarZoneVO(uCarZoneVO);
			carVO.setCarModelInfoVO(carModelInfoVO);
			reservationVO.setCarVO(carVO);
			mv.addObject("realtimeSearchResult", searchService.searchCar(reservationVO));
		}
		return mv;
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
	
	@RequestMapping("search_searchMapList.do")
	@ResponseBody
	public List<UCarZoneVO> searchMapList(){
		List<UCarZoneVO> list = searchService.getMapInfo();
		System.out.println("맵위도경도:"	+ list.size());
		return searchService.getMapInfo();
	}
	
	@RequestMapping("search_searchUCarZone.do")
	@ResponseBody
	public List<String> searchUCarZone(String term){
		return searchService.searchUCarZone(term);
	}
}
