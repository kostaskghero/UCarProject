package ucar.car.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
		String model=cvo.getCarModelInfoVO().getCarModel();
		String uCarZone=cvo.getuCarZoneVO().getuCarZoneName();
		String nickName=cvo.getCarNickName();
	//	System.out.println(model+" ,"+uCarZone+","+nickName+"//d뚱루둡루둡듀");
		if((model==null||model.equals(""))&&(uCarZone==null||uCarZone.equals(""))&&(nickName==null||nickName.equals(""))){
			System.out.println("셋다x");
			return carDAO.getAllCarList();
		}else if((model!=null||!model.equals(""))&&(uCarZone==null||uCarZone.equals(""))&&(nickName==null||nickName.equals(""))){
			System.out.println("모델");
			return carDAO.searchCarByModel(cvo);
		}
		else if((model==null||model.equals(""))&&(uCarZone!=null||!uCarZone.equals(""))&&(nickName==null||nickName.equals(""))){
			System.out.println("유카존");
			return carDAO.searchCarByUCarZone(cvo);
		}else if((model==null||model.equals(""))&&(uCarZone==null||uCarZone.equals(""))&&(nickName!=null||!nickName.equals(""))){
			System.out.println("닉네임");
			return carDAO.searchCarByNickName(cvo);
		}else if((model!=null||!model.equals(""))&&(uCarZone==null||uCarZone.equals(""))&&(nickName!=null||!nickName.equals(""))){
			System.out.println("모델+닉네임");
			return carDAO.searchCarByModelAndNickName(cvo);
		}else if((model!=null||!model.equals(""))&&(uCarZone!=null||!uCarZone.equals(""))&&(nickName==null||nickName.equals(""))){
			System.out.println("모델+유카존");
			return carDAO.searchCarByModelAndUCarZone(cvo);
		}else if((model==null||model.equals(""))&&(uCarZone!=null||!uCarZone.equals(""))&&(nickName!=null||!nickName.equals(""))){
			System.out.println("유카존+닉네임");
			return carDAO.searchCarByUCarZoneAndNickName(cvo);
		}else if((model!=null||!model.equals(""))&&(uCarZone!=null||!uCarZone.equals(""))&&(nickName!=null||!nickName.equals(""))){
			System.out.println("셋다검색");
			return carDAO.searchCarByModelAndUCarZoneAndNickName(cvo);
		}
	
	/*	if (!cvo.getCarModelInfoVO().getCarModel().equals("")
				|| cvo.getCarModelInfoVO().getCarModel() != null) {// 검색에서model존재
			if (!cvo.getuCarZoneVO().getuCarZoneName().equals("")
					|| cvo.getuCarZoneVO().getuCarZoneName() != null) {// 유카존 존재
				if (!cvo.getCarNickName().equals("")
						|| cvo.getCarNickName() != null) {// 닉네임존재
					System.out.println("모두존재");
					return carDAO.searchCarByModelAndUCarZoneAndNickName(cvo);// 모두존재
				} else {// 닉네임존재x
					System.out.println("모델,유카존");
					return carDAO.searchCarByModelAndUCarZone(cvo);// 모델,유카존존재
				}
			} else {// 모델존재, 유카존 존재x
				if (!cvo.getCarNickName().equals("")
						|| cvo.getCarNickName() != null) {// 모델,닉네임존재
					System.out.println("모델,닉네임");
					return carDAO.searchCarByModelAndNickName(cvo);
				} else {// 모델만 존재
					System.out.println("모델");
					return carDAO.searchCarByModel(cvo);
				}
			}
		} else {// 모델 존재x
			if (!cvo.getuCarZoneVO().getuCarZoneName().equals("")
					|| cvo.getuCarZoneVO().getuCarZoneName() != null) {// 유카존이
																		// 존재
				if (!cvo.getCarNickName().equals("")
						|| cvo.getCarNickName() != null) {// 닉네임이 존재
					System.out.println("유카존,닉네임");
					return carDAO.searchCarByUCarZoneAndNickName(cvo);
				} else {// 닉네임 x
					System.out.println("유카존");
					return carDAO.searchCarByUCarZone(cvo);
				}
			} else {// 유카존x
				if (!cvo.getCarNickName().equals("")
						|| cvo.getCarNickName() != null) {// 닉네임이 존재
					System.out.println("닉네임");
					return carDAO.searchCarByNickName(cvo);
				} else {// 닉네임 x
					System.out.println("조건없음");
					return carDAO.getAllCarList();
				}
			}
		}*/
return null;}
}
