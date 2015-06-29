package ucar.car.model;

import java.util.List;

public interface CarDAO {
	public void registerCar(CarVO cvo);

	public List<String> getCarTypeList();

	public List<CarVO> getAllCarList();

	public List<String> getCarModelByType(String carType);

	public CarVO carNickNameCheck(String carNickName);

	public void registerUCarZone(UCarZoneVO zvo);

	public List<UCarZoneVO> getAllUCarZoneList();

	public UCarZoneVO uCarZoneNameCheck(String uCarZoneName);

	public List<String> searchUCarZone(String term);

	public UCarZoneVO checkUCarZone(String uCarZoneName);

	public CarVO findCarByNo(int carNo);

	public void updateCar(CarVO cvo);

	public void deleteCar(int carNo);

	public CarVO getCarDetailInfoByCarNo(int carNo);

	public List<String> getCarModelList();

	public List<CarVO> searchCarByModel(CarVO cvo);

	public List<CarVO> searchCarByUCarZone(CarVO cvo);

	public List<CarVO> searchCarByNickName(CarVO cvo);

	public List<CarVO> searchCarByModelAndUCarZone(CarVO cvo);

	public List<CarVO> searchCarByModelAndNickName(CarVO cvo);

	public List<CarVO> searchCarByUCarZoneAndNickName(CarVO cvo);

	public List<CarVO> searchCarByModelAndUCarZoneAndNickName(CarVO cvo);

	public void deleteUcarZone(String uCarZoneName);

	public List<CarVO> searchCarByUCarZoneName(String uCarZoneName);

	public void updateUcarZone(UCarZoneVO zvo);

	public void registerCarModel(CarModelInfoVO carDetailVO);

	public void registerCarPic(CarPicVO carPicVO);

	public void registerCarOption(CarOptionVO carOptionVO);

	public CarModelInfoVO carModelNameCheck(String modelName);

	public List<CarModelInfoVO> getAllModelList();

	public List<String> getModelOption(String carModel);

	public CarModelInfoVO getMdoelDetailInfo(String carModel);
	public void deleteCarModel(String carModel);
	public void deleteCarOption(String carModel);

}
