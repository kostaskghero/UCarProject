package ucar.car.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAOImpl implements CarDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public void registerCar(CarVO cvo) {

		sqlSessionTemplate.insert("car.registerCar", cvo);
	}

	public List<String> getCarTypeList() {
		return sqlSessionTemplate.selectList("car.getCarTypeList");
	}

	public List<CarVO> getAllCarList() {
		return sqlSessionTemplate.selectList("car.getAllCarList");
	}

	@Override
	public List<String> getCarModelByType(String carType) {

		return sqlSessionTemplate.selectList("car.getCarModelByType", carType);
	}

	@Override
	public CarVO carNickNameCheck(String carNickName) {
		return sqlSessionTemplate
				.selectOne("car.carNickNameCheck", carNickName);
	}

	public void registerUCarZone(UCarZoneVO zvo) {
		sqlSessionTemplate.insert("ucarzone.registerUCarZone", zvo);
	}

	public List<UCarZoneVO> getAllUCarZoneList() {
		/*
		 * System.out.println(sqlSessionTemplate
		 * .selectList("ucarzone.getAllUCarZoneList"));
		 */
		return sqlSessionTemplate.selectList("ucarzone.getAllUCarZoneList");
	}

	public UCarZoneVO uCarZoneNameCheck(String uCarZoneName) {
		return sqlSessionTemplate.selectOne("ucarzone.uCarZoneNameCheck",
				uCarZoneName);
	}

	public List<String> searchUCarZone(String term) {
		return sqlSessionTemplate.selectList("ucarzone.searchUCarZone", term);
	}

	public UCarZoneVO checkUCarZone(String uCarZoneName) {
		return sqlSessionTemplate.selectOne("ucarzone.checkUCarZone",
				uCarZoneName);
	}

	public CarVO findCarByNo(int carNo) {
		return sqlSessionTemplate.selectOne("car.findCarByNo", carNo);
	}

	public void updateCar(CarVO cvo) {
		sqlSessionTemplate.update("car.updateCar", cvo);
	}

	public void deleteCar(int carNo) {
		sqlSessionTemplate.delete("car.deleteCar", carNo);
	}

	public CarVO getCarDetailInfoByCarNo(int carNo) {
		return sqlSessionTemplate.selectOne("car.getCarDetailInfoByCarNo",
				carNo);
	}

	@Override
	public List<String> getCarModelList() {

		return sqlSessionTemplate.selectList("car.getCarModelList");
	}

	public List<CarVO> searchCarByModel(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByModel", cvo);
	}

	public List<CarVO> searchCarByUCarZone(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByUCarZone", cvo);
	}

	public List<CarVO> searchCarByNickName(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByNickName", cvo);
	}

	public List<CarVO> searchCarByModelAndUCarZone(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByModelAndUCarZone",
				cvo);
	}

	public List<CarVO> searchCarByModelAndNickName(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByModelAndNickName",
				cvo);
	}

	public List<CarVO> searchCarByUCarZoneAndNickName(CarVO cvo) {
		return sqlSessionTemplate.selectList(
				"car.searchCarByUCarZoneAndNickName", cvo);
	}

	public List<CarVO> searchCarByModelAndUCarZoneAndNickName(CarVO cvo) {
		System.out.println("ㅇDAODODODOD" + cvo);
		return sqlSessionTemplate.selectList(
				"car.searchCarByModelAndUCarZoneAndNickName", cvo);
	}

	@Override
	public void deleteUcarZone(String uCarZoneName) {
		sqlSessionTemplate.delete("ucarzone.deleteUcarZone", uCarZoneName);
	}

	@Override
	public List<CarVO> searchCarByUCarZoneName(String uCarZoneName) {
		return sqlSessionTemplate.selectList("car.searchCarByUCarZoneName",
				uCarZoneName);
	}

	public void updateUcarZone(UCarZoneVO zvo) {
		sqlSessionTemplate.update("ucarzone.updateUcarZone", zvo);
	}

	public void registerCarModel(CarModelInfoVO carDetailVO){
		sqlSessionTemplate.insert("car.registerCarModel",carDetailVO);
	}
	public void registerCarPic(CarPicVO carPicVO){
		sqlSessionTemplate.insert("car.registerCarPic",carPicVO);
	}

	@Override
	public void registerCarOption(CarOptionVO carOptionVO) {

		sqlSessionTemplate.insert("car.registerCarOption",carOptionVO);
	}
	public CarModelInfoVO carModelNameCheck(String modelName){
		return sqlSessionTemplate.selectOne("carModelNameCheck",modelName);
	}
	public List<CarModelInfoVO> getAllModelList(){
		return sqlSessionTemplate.selectList("car.getAllModelList");
	}
	public List<String> getModelOption(String carModel){
		return sqlSessionTemplate.selectList("car.getModelOption",carModel);
	}
	public CarModelInfoVO getMdoelDetailInfo(String carModel){
		return sqlSessionTemplate.selectOne("car.getMdoelDetailInfo",carModel);
	}
	public void deleteCarModel(String carModel){
		sqlSessionTemplate.delete("car.deleteCarModel",carModel);
	}
	public void deleteCarOption(String carModel){
		sqlSessionTemplate.delete("car.deleteCarOption",carModel);
	}
	public List<CarVO> modelDeleteCheck(String carModel){
		return sqlSessionTemplate.selectList("car.modelDeleteCheck",carModel);
	}
}
