package ucar.sharing.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 * 차량검색폼으로 이동
	 * 차종리스트를 반환한다.
	 * @return
	 */
	@RequestMapping("search_searchForm.do")
	public ModelAndView searchForm(){
/*		List<UCarZoneVO> list = searchService.getMapInfo();
		 private double latitude;//위도
   private double longitude;//경도
		System.out.println(list.toString()); 
		return new ModelAndView("sharing_search_form", "carModelList", searchService.getAllCarModelList());*/
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<UCarZoneVO> list = searchService.getMapInfo();
		ArrayList<Double> listLatitude = new ArrayList<Double>();
		ArrayList<Double> listLongitude = new ArrayList<Double>();
		ArrayList<String> listName = new ArrayList<String>();
		map.put("carModelList", searchService.getAllCarModelList());
		map.put("uCarZoneListLati", listLatitude);
		map.put("uCarZoneListLong", listLongitude);
		map.put("uCarZoneListName", listName);
		map.put("longCount", list.size());
		System.out.println(list.size());
		System.out.println(list.toString());
		
		for(int i=0; i<list.size(); i++){
			listLatitude.add(list.get(i).getLatitude());
			listLongitude.add(list.get(i).getLongitude());
			listName.add(list.get(i).getuCarZoneName());
		}
	/*	
		for(int i=0; i<listLatitude.size(); i++) {
			System.out.println(list.get(i));
		}
		for(int i=0; i<listLongitude.size(); i++) {
			System.out.println(list.get(i));
		}
		for(int i=0; i<listName.size(); i++) {
			System.out.println(list.get(i));
		}*/
		return new ModelAndView("sharing_search_form", "mapDate", map);
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
