package ucar.car.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CarServiceImpl implements CarService {
	@Resource
	private CarDAO carDAO;

	public List<String> getCarTypeList() {
		return carDAO.getCarTypeList();
	}

	public void registerCar(CarVO cvo) {
		System.out.println("service" + cvo);
		carDAO.registerCar(cvo);
	}

	public List<String> getCarModelByType(String carType) {
		return carDAO.getCarModelByType(carType);
	}

	@Override
	public CarVO carNickNameCheck(String carNickName) {
		return carDAO.carNickNameCheck(carNickName);
	}

	public List<CarVO> getAllCarList() {
		return carDAO.getAllCarList();
	}

	public void registerUCarZone(UCarZoneVO zvo) {
		carDAO.registerUCarZone(zvo);
	}

	public List<UCarZoneVO> getAllUCarZoneList() {
		return carDAO.getAllUCarZoneList();
	}

	public boolean uCarZoneNameCheck(String uCarZoneName) {
		boolean flag = false;
		UCarZoneVO zvo = carDAO.uCarZoneNameCheck(uCarZoneName);
		if (zvo != null) {// 존재하면
			flag = true;
		}
		return flag;
	}

	public List<String> searchUCarZone(String term) {
		return carDAO.searchUCarZone(term);
	}

	@Override
	public UCarZoneVO checkUCarZone(String uCarZoneName) {

		return carDAO.checkUCarZone(uCarZoneName);
	}

	@Override
	public CarVO findCarByNo(int carNo) {
		return carDAO.findCarByNo(carNo);

	}

	public void updateCar(CarVO cvo) {
		carDAO.updateCar(cvo);
	}

	public void deleteCar(int carNo) {
		carDAO.deleteCar(carNo);
	}

	@Override
	public CarVO getCarDetailInfoByCarNo(int carNo) {
		return carDAO.getCarDetailInfoByCarNo(carNo);
	}

	public List<String> getCarModelList() {
		return carDAO.getCarModelList();
	}

	@Override
	public List<CarVO> searchCarByCondition(CarVO cvo) {
		String model = cvo.getCarModelInfoVO().getCarModel();
		String uCarZone = cvo.getuCarZoneVO().getuCarZoneName();
		String nickName = cvo.getCarNickName();
		// System.out.println(model+" ,"+uCarZone+","+nickName+"//d뚱루둡루둡듀");
		if ((model == null || model.equals(""))
				&& (uCarZone == null || uCarZone.equals(""))
				&& (nickName == null || nickName.equals(""))) {
			System.out.println("셋다x");
			return carDAO.getAllCarList();
		} else if ((model != null || !model.equals(""))
				&& (uCarZone == null || uCarZone.equals(""))
				&& (nickName == null || nickName.equals(""))) {
			System.out.println("모델");
			return carDAO.searchCarByModel(cvo);
		} else if ((model == null || model.equals(""))
				&& (uCarZone != null || !uCarZone.equals(""))
				&& (nickName == null || nickName.equals(""))) {
			System.out.println("유카존");
			return carDAO.searchCarByUCarZone(cvo);
		} else if ((model == null || model.equals(""))
				&& (uCarZone == null || uCarZone.equals(""))
				&& (nickName != null || !nickName.equals(""))) {
			System.out.println("닉네임");
			return carDAO.searchCarByNickName(cvo);
		} else if ((model != null || !model.equals(""))
				&& (uCarZone == null || uCarZone.equals(""))
				&& (nickName != null || !nickName.equals(""))) {
			System.out.println("모델+닉네임");
			return carDAO.searchCarByModelAndNickName(cvo);
		} else if ((model != null || !model.equals(""))
				&& (uCarZone != null || !uCarZone.equals(""))
				&& (nickName == null || nickName.equals(""))) {
			System.out.println("모델+유카존");
			return carDAO.searchCarByModelAndUCarZone(cvo);
		} else if ((model == null || model.equals(""))
				&& (uCarZone != null || !uCarZone.equals(""))
				&& (nickName != null || !nickName.equals(""))) {
			System.out.println("유카존+닉네임");
			return carDAO.searchCarByUCarZoneAndNickName(cvo);
		} else if ((model != null || !model.equals(""))
				&& (uCarZone != null || !uCarZone.equals(""))
				&& (nickName != null || !nickName.equals(""))) {
			System.out.println("셋다검색");
			return carDAO.searchCarByModelAndUCarZoneAndNickName(cvo);
		}

		return null;
	}

	@Override
	public void deleteUcarZone(String uCarZoneName) {
		carDAO.deleteUcarZone(uCarZoneName);

	}

	@Override
	public List<CarVO> searchCarByUCarZoneName(String uCarZoneName) {
		return carDAO.searchCarByUCarZoneName(uCarZoneName);
	}

	@Override
	public void updateUcarZone(UCarZoneVO zvo) {
		carDAO.updateUcarZone(zvo);
	}

	@Override
	public void registerCarModel(CarModelInfoVO carModelVO) {
		carDAO.registerCarModel(carModelVO);

	}

	@Override
	public void registerCarPic(CarPicVO carPicVO) {
		carDAO.registerCarPic(carPicVO);
	}

	@Override
	public void registerCarOption(CarOptionVO carOptionVO) {
		for (int i = 0; i < carOptionVO.getoptionInfo().size(); i++) {
			carOptionVO.setOptionComp(carOptionVO.getoptionInfo().get(i));
			carDAO.registerCarOption(carOptionVO);
		}
	}

	@Override
	public CarModelInfoVO carModelNameCheck(String modelName) {
		return carDAO.carModelNameCheck(modelName);
	}

	@Override
	public List<CarModelInfoVO> getAllModelList() {
		return carDAO.getAllModelList();
	}

	@Override
	public CarModelInfoVO getModelDetailInfo(String carModel) {
		CarModelInfoVO carModelVO=carDAO.getMdoelDetailInfo(carModel);
		carModelVO.setCarOption(carDAO.getModelOption(carModel));
		return carModelVO;
	}

	@Override
	@Transactional
	public void deleteCarModelAndOption(String carModel) {
	 carDAO.deleteCarModel(carModel);
	 carDAO.deleteCarOption(carModel);
	}
}
