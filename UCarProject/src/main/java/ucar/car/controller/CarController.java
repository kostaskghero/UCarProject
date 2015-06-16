package ucar.car.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.car.model.CarModelInfoVO;
import ucar.car.model.CarService;
import ucar.car.model.CarVO;
import ucar.car.model.UCarZoneVO;

@Controller
public class CarController {

	@Resource
	private CarService carService;

	/**
	 * 차량리스트 jsp로 이동하는 메서드 이때 테이블에서 사용할 모든
	 *  차량목록과 select에 넣을 모델과 유카존 리스트를 맵에 담아
	 * 보내준다.
	 * 
	 * @return
	 */
	@RequestMapping("admin_car_list.do")
	public ModelAndView getAllCarList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CarVO> carList = carService.getAllCarList();
		List<UCarZoneVO> uCarZoneList = carService.getAllUCarZoneList();
		List<String> modelList = carService.getCarModelList();
		map.put("carList", carList);
		map.put("uCarZoneList", uCarZoneList);
		map.put("modelList", modelList);

		return new ModelAndView("admin_car_list", "data", map);
	}

	/**
	 * 차량 등록 폼jsp로 보내는 메서드 이때 차량타입 select를
	 *  생성하기 위해 리스트를 담아 보낸다.
	 * 
	 * @return
	 */
	@RequestMapping("admin_carRegisterForm.do")
	public ModelAndView carRegisterForm() {
		List<String> list = carService.getCarTypeList();
		return new ModelAndView("admin_carRegisterForm", "carTypeList", list);
	}
	/**
	 * 차량 등록폼에서 자동차 타입이 선택되면 ajax로 
	 * 해당 타입에 해당하는 차량모델 리스트를 제공하는 메서드
	 * @param carType
	 * @return
	 */
	@RequestMapping("getCarModelByType.do")
	@ResponseBody
	public List<String> getCarModelByType(String carType) {
		List<String> list = carService.getCarModelByType(carType);
		return list;
	}
	/**
	 * 차량 등록 폼에서 입력정보를 받아와서 
	 * has a관계인 VO들을 set해주고 
	 * 등록메서드를 호출한다. 
	 * 리다이렉트로 차량리스트를 보여주기 위한 admin_car_list.do로 이동한다. 
	 * @param cvo
	 * @param zvo
	 * @param modelVO
	 * @return
	 */
	@RequestMapping("admin_carRegister.do")
	public ModelAndView registerCar(CarVO cvo, UCarZoneVO zvo,
			CarModelInfoVO modelVO) {
		cvo.setuCarZoneVO(zvo);
		cvo.setCarModelInfoVO(modelVO);
		carService.registerCar(cvo);
		return new ModelAndView("redirect:admin_car_list.do?carNo="
				+ cvo.getCarNo());
	}

	/**
	 *  차량등록페이지에서 입력 닉네임의 존재여부를 
	 *  ajax로 확인한다. 
	 *  닉네임이 중복되어 사용할 수 없으면 fail
	 *  그렇지 않아 사용가능하면 O를 리턴한다.
	 * @param carNickName
	 * @return
	 */
	@RequestMapping("nickNamecheck.do")
	@ResponseBody
	public String nickNamecheck(String carNickName) {
		CarVO vo = carService.carNickNameCheck(carNickName);
		if (vo != null) {
			return "fail";
		}
		return "O";
	}
	/**
	 * 유카존 등록 폼으로 이동시켜준다.
	 * @return
	 */
	@RequestMapping("admin_uCarZoneRegisterForm.do")
	public ModelAndView uCarZoneRegisterForm() {
		return new ModelAndView("admin_uCarZoneRegisterForm");
	}
	/**
	 * 입력받은 유카존 정보를 받아서 
	 * 유카존 등록메서드를 호출해준다.
	 * 등록후에는 리다이렉트로 admin_uCarZone_list.do로보내
	 * 모든 유카존 리스트를 보여주는 페이지로 보내준다. 
	 * @param zvo
	 * @return
	 */
	@RequestMapping("admin_uCarZoneRegister.do")
	public ModelAndView uCarZoneRegitser(UCarZoneVO zvo) {
		carService.registerUCarZone(zvo);
		return new ModelAndView("redirect:admin_uCarZone_list.do");
	}
	/**
	 * 모든 유카존의 리스트를 보여주는 메서드 
	 * @return
	 */
	@RequestMapping("admin_uCarZone_list.do")
	public ModelAndView uCarZoneList() {
		List<UCarZoneVO> list = carService.getAllUCarZoneList();
		return new ModelAndView("admin_uCarZone_list", "list", list);
	}
	/**
	 * 유카존등록시 유카존의 이름이 유니크해야하므로
	 * 중복검사를 하는 메서드 .
	 * ajax로 입력받은 이름이 중복되는지 확인하여
	 * DB에 존재하여 사용할 수 없으면 fail을 리턴하고
	 *존재하지 않아 사용가능하면O를 리턴한다.
	 * @param uCarZoneName
	 * @return
	 */
	@RequestMapping("uCarZoneNameCheck.do")
	@ResponseBody
	public String uCarZoneNameCheck(String uCarZoneName) {

		boolean flag = carService.uCarZoneNameCheck(uCarZoneName);
		if (flag == true) {// 중복되면
			return "fail";
		}
		return "OK";
	}
	/**
	 * 차량등록 및 수정시에 유카존 검색과 
	 * db에 존재하지 않는 유카존 입력으로 무결성 exception방지를 위해 
	 * 자동완성기능을 수행하는메서드 
	 * DB에 해당 단어가 들어있는 유카존 이름의 목록을 반환해 준다. 
	 * @param term
	 * @return
	 */
	@RequestMapping("searchUCarZone.do")
	@ResponseBody
	public List<String> searchUCarZone(String term) {
		List<String> list = carService.searchUCarZone(term);
		return list;
	}
	/**
	 * 무결성 제약 exception 방지를 위해 존재하는 
	 * 유카존인지를 ajax로 확인한다.
	 * 입력한 유카존이 존재하여 사용할수 있다면 ok를
	 * 존재하지 않아 사용할 수 없다면 fail을 리턴한다.
	 * @param uCarZoneName
	 * @return
	 */
	@RequestMapping("uCarZoneCheck.do")
	@ResponseBody
	public String uCarZoneCheck(String uCarZoneName) {
		UCarZoneVO vo = carService.checkUCarZone(uCarZoneName);
		if (vo != null) {// 존재하면
			return "ok";
		}
		return "fail";
	}
	/**
	 * 목록에서 해당 자동차의 수정버튼을 클릭하면 
	 * 그 자동차의 번호를 받아 vo를 검색하여 
	 * 수정 폼으로 이동시켜준다.
	 * @param carNo
	 * @return
	 */
	@RequestMapping("admin_carUpdateForm.do")
	public ModelAndView updateCarForm(int carNo) {

		CarVO vo = carService.findCarByNo(carNo);
		return new ModelAndView("admin_carUpdateForm", "info", vo);

	}
	/**
	 * 수정폼에서 입력받은 정보들을 받아와
	 * 해당 자동차번호에 업데이트 시켜주는 메서드.
	 * 완료후 리다이렉트로 :admin_car_list.do로 이동시켜
	 * 전체 유카존 목록을을 보여주는 페이지로 이동한다. 
	 * @param cvo
	 * @param zvo
	 * @param modelVO
	 * @return
	 */
	@RequestMapping("admin_carUpdate.do")
	public ModelAndView carUpdate(CarVO cvo, UCarZoneVO zvo,
			CarModelInfoVO modelVO) {
		cvo.setuCarZoneVO(zvo);
		cvo.setCarModelInfoVO(modelVO);
		carService.updateCar(cvo);
		return new ModelAndView("redirect:admin_car_list.do");
	}
	/**
	 * 자동차 리스트 jsp에서 해당 자동차의 삭제버튼을 클릭하면 
	 * 컨펌으로 확인후 해당 번호의 정보를 
	 * db에서 삭제 하는 메서드 
	 * @param carNo
	 * @return
	 */
	@RequestMapping("admin_carDeleteForm.do")
	public ModelAndView deleteCar(int carNo) {
		carService.deleteCar(carNo);
		return new ModelAndView("redirect:admin_car_list.do");
	}
	/**
	 *  자동차 번호로 해당 자동차의 디테일 정보를 반환시켜준다. 
	 *  일단은 jsp로 넘기지만 이후에 hover로 ajax로 처리할 예정이다. 
	 *  
	 * @param carNo
	 * @return
	 */
	@RequestMapping("admin_carDetailInfo.do")
	public ModelAndView carDetailInfo(int carNo) {
		CarVO vo = carService.getCarDetailInfoByCarNo(carNo);
		return new ModelAndView("admin_carDetailInfo", "info", vo);
	}
	/**
	 * 자동차 모델, 유카존 이름, 닉네임 의 3가지 조건을 조합하여
	 * 자동차 검색을 하는 메서드 
	 * ajax로 검색버튼을 누를때마다 div의 테이블이 바뀐다. 
	 * @param cvo
	 * @param zvo
	 * @param modelVO
	 * @return
	 */
	@RequestMapping("admin_searchCar.do")
	@ResponseBody
	public List<CarVO> searchCar(CarVO cvo, UCarZoneVO zvo,
			CarModelInfoVO modelVO) {
		cvo.setuCarZoneVO(zvo);
		cvo.setCarModelInfoVO(modelVO);
		System.out.println("받아오는 cvo" + cvo);
		List<CarVO> searchList = carService.searchCarByCondition(cvo);
		System.out.println(searchList + "controllertest");
		return searchList;
	}
}