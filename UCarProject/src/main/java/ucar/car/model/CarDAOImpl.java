package ucar.car.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAOImpl implements CarDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 차량 등록
	 */
	public void registerCar(CarVO cvo) {
		sqlSessionTemplate.insert("car.registerCar", cvo);
	}
	/**
	 * 자동차 테이블에서 차량종류 리스트를 distinct로 받아온다.
	 */
	public List<String> getCarTypeList() {
		return sqlSessionTemplate.selectList("car.getCarTypeList");
	}
	/**
	 * car 테이블에 존재하는 모든 차량 리스트 
	 */
	public List<CarVO> getAllCarList() {
		return sqlSessionTemplate.selectList("car.getAllCarList");
	}
	/**
	 * 선택한 차량종류에 해당하는 모델을 받아온다.
	 */
	@Override
	public List<String> getCarModelByType(String carType) {
		return sqlSessionTemplate.selectList("car.getCarModelByType", carType);
	}
	/**
	 * 차량 닉네임 중복검사
	 */
	@Override
	public CarVO carNickNameCheck(String carNickName) {
		return sqlSessionTemplate
				.selectOne("car.carNickNameCheck", carNickName);
	}
	/**
	 * 유카존 등록
	 */
	public void registerUCarZone(UCarZoneVO zvo) {
		sqlSessionTemplate.insert("ucarzone.registerUCarZone", zvo);
	}
	/**
	 * 전체 유카존 리스트 반환
	 */
	public List<UCarZoneVO> getAllUCarZoneList() {
		return sqlSessionTemplate.selectList("ucarzone.getAllUCarZoneList");
	}
	/**
	 * 유카존 이름 중복검사
	 */
	public UCarZoneVO uCarZoneNameCheck(String uCarZoneName) {
		return sqlSessionTemplate.selectOne("ucarzone.uCarZoneNameCheck",
				uCarZoneName);
	}
	/**
	 * 입력한 유카존이 존재하는지 검사
	 */
	public List<String> searchUCarZone(String term) {
		return sqlSessionTemplate.selectList("ucarzone.searchUCarZone", term);
	}
	/**
	 * 해당 유카존이름으로 유카존 정보 반환
	 */
	public UCarZoneVO checkUCarZone(String uCarZoneName) {
		return sqlSessionTemplate.selectOne("ucarzone.checkUCarZone",
				uCarZoneName);
	}
	/**
	 * 차 번호로 차량 검색
	 */
	public CarVO findCarByNo(int carNo) {
		return sqlSessionTemplate.selectOne("car.findCarByNo", carNo);
	}
	/**
	 * 차량 정보 수정
	 */
	public void updateCar(CarVO cvo) {
		sqlSessionTemplate.update("car.updateCar", cvo);
	}
	/**
	 * 차량 삭제
	 */
	public void deleteCar(int carNo) {
		sqlSessionTemplate.delete("car.deleteCar", carNo);
	}
	/**
	 * 차랴번호로 차량 상세정보 검색
	 */
	public CarVO getCarDetailInfoByCarNo(int carNo) {
		return sqlSessionTemplate.selectOne("car.getCarDetailInfoByCarNo",
				carNo);
	}
	/**
	 * 모든 차모델 목록
	 */
	@Override
	public List<String> getCarModelList() {
		return sqlSessionTemplate.selectList("car.getCarModelList");
	}
	/**
	 * 차모델에 해당하는 차량목록 검색
	 */
	public List<CarVO> searchCarByModel(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByModel", cvo);
	}
	/**
	 * 차량목록에서 유카존으로 검색
	 */
	public List<CarVO> searchCarByUCarZone(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByUCarZone", cvo);
	}
	/**
	 * 차량목록에서 차량 닉네임으로 검색
	 */
	public List<CarVO> searchCarByNickName(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByNickName", cvo);
	}
	/**
	 * 차량목록에서 차량 모델과 유카존으로 검색
	 */
	public List<CarVO> searchCarByModelAndUCarZone(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByModelAndUCarZone",
				cvo);
	}
	/**
	 * 차량목록에서 차모델과 차량닉네임으로 검색
	 */
	public List<CarVO> searchCarByModelAndNickName(CarVO cvo) {
		return sqlSessionTemplate.selectList("car.searchCarByModelAndNickName",
				cvo);
	}
	/**
	 * 차량목록에서 유카존과 차량 닉네임으로 검색
	 */
	public List<CarVO> searchCarByUCarZoneAndNickName(CarVO cvo) {
		return sqlSessionTemplate.selectList(
				"car.searchCarByUCarZoneAndNickName", cvo);
	}
	/**
	 * 차량목록에서 차모델과 유카존, 차량닉네임으로 검색
	 */
	public List<CarVO> searchCarByModelAndUCarZoneAndNickName(CarVO cvo) {
		System.out.println("ㅇDAODODODOD" + cvo);
		return sqlSessionTemplate.selectList(
				"car.searchCarByModelAndUCarZoneAndNickName", cvo);
	}
	/**
	 * 유카존 삭제
	 */
	@Override
	public void deleteUcarZone(String uCarZoneName) {
		sqlSessionTemplate.delete("ucarzone.deleteUcarZone", uCarZoneName);
	}
	/**
	 * 검색한 유카존에 차량이 존재하는지 확인
	 */
	@Override
	public List<CarVO> searchCarByUCarZoneName(String uCarZoneName) {
		return sqlSessionTemplate.selectList("car.searchCarByUCarZoneName",
				uCarZoneName);
	}
	/**
	 * 유카존 정보수정
	 */
	public void updateUcarZone(UCarZoneVO zvo) {
		sqlSessionTemplate.update("ucarzone.updateUcarZone", zvo);
	}
	/**
	 * 차량 모델 등록
	 */
	public void registerCarModel(CarModelInfoVO carDetailVO){
		sqlSessionTemplate.insert("car.registerCarModel",carDetailVO);
	}
	/**
	 * 차량모델 사진 등록
	 */
	public void registerCarPic(CarPicVO carPicVO){
		sqlSessionTemplate.insert("car.registerCarPic",carPicVO);
	}
	/**
	 * 차량 모델 등록시 옵션 등록
	 */
	@Override
	public void registerCarOption(CarOptionVO carOptionVO) {
		sqlSessionTemplate.insert("car.registerCarOption",carOptionVO);
	}
	/**
	 * 차량모델 이름 중복 검사
	 */
	public CarModelInfoVO carModelNameCheck(String modelName){
		return sqlSessionTemplate.selectOne("carModelNameCheck",modelName);
	}
	/**
	 * 모든 차량 모델 목록 반환
	 */
	public List<CarModelInfoVO> getAllModelList(){
		return sqlSessionTemplate.selectList("car.getAllModelList");
	}
	/**
	 * 검색한 차량 모델에 해당하는 옵션을 반환
	 */
	public List<String> getModelOption(String carModel){
		return sqlSessionTemplate.selectList("car.getModelOption",carModel);
	}
	/**
	 * 차량 모델의 상세 정보 검색
	 */
	public CarModelInfoVO getMdoelDetailInfo(String carModel){
		return sqlSessionTemplate.selectOne("car.getMdoelDetailInfo",carModel);
	}
	/**
	 * 차량 모델 삭제
	 */
	public void deleteCarModel(String carModel){
		sqlSessionTemplate.delete("car.deleteCarModel",carModel);
	}
	/**
	 * 해당 모델의 옵션 삭제
	 */
	public void deleteCarOption(String carModel){
		sqlSessionTemplate.delete("car.deleteCarOption",carModel);
	}
	/**
	 * 차량 모델을 삭제할 때 해당 모델에 등록된 차량이 있는지 검사 
	 */
	public List<CarVO> modelDeleteCheck(String carModel){
		return sqlSessionTemplate.selectList("car.modelDeleteCheck",carModel);
	}
}
