package ucar.car.model;

import java.util.List;

public interface CarService {
	public void registerCar(CarVO cvo);
	public List<String> getCarTypeList();
	public List<String> getCarModelByType(String carType);
	public CarVO carNickNameCheck(String carNickName);
	public List<CarVO> getAllCarList ();
	public void registerUCarZone(UCarZoneVO zvo);
	public List<UCarZoneVO> getAllUCarZoneList() ;
	public boolean uCarZoneNameCheck(String uCarZoneName);
	public List<String> searchUCarZone(String term);
	public UCarZoneVO checkUCarZone(String uCarZoneName);
	public CarVO findCarByNo(int carNo );
	public void updateCar(CarVO cvo);
	public void deleteCar(int carNo);
	public CarVO getCarDetailInfoByCarNo(int carNo);
	public List<String> getCarModelList();
	public List<CarVO> searchCarByCondition(CarVO cvo);
}