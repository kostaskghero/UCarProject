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
	 * 검색 페이지에 필요한 정보를 제공한다.
	 * 구글맵에 유카존을 매핑하기 위해 모든 유카존의 정보를 조회해서 ucarZoneList 에 세팅하고
	 * 차종 검색에 필요한 자동차 모델 목록을 carModelList 에 세팅한다.
	 * 메인페이지에서 검색 할 경우 검색결과를 realtimeSearchResult 에 세팅한다.
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
			mv.addObject("realtimeSearchResult", searchCar(reservationVO, carVO, carModelInfoVO, uCarZoneVO));
		}
		return mv;
	}
	/**
	 * 자동차 검색
	 * 검색조건을 ReservationVO 에 세팅하고 조건에 해당하는 자동차 리스트를 리턴한다. 
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
	
	/**
	 * 유카존 검색
	 * 유카존에 term 을 입력하면 term 포함하는 모든 유카존을 반환한다.
	 * @param term
	 * @return
	 */
	@RequestMapping("search_searchUCarZone.do")
	@ResponseBody
	public List<String> searchUCarZone(String term){
		return searchService.searchUCarZone(term);
	}
}
