package ucar.car.model;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CarServiceImpl implements CarService {
	@Resource
	private CarDAO carDAO;
	@Resource(name = "uploadCarPicPath")
	private String uploadCarPicPath;
	@Resource(name = "viewCarPath")
	private String viewCarPath;
	/**
	 * 전체 차종 목록을 반환하는 메서드 
	 */
	public List<String> getCarTypeList() {
		return carDAO.getCarTypeList();
	}
	/**
	 * 차량 등록 메서드 
	 */
	public void registerCar(CarVO cvo) {
		carDAO.registerCar(cvo);
	}
	/**
	 * 차종에 해당하는 차량 모델 목록을 반환하는 메서드 
	 */
	public List<String> getCarModelByType(String carType) {
		return carDAO.getCarModelByType(carType);
	}
	/**
	 * 차량 등록시 닉네임 중복검사 
	 * DB에 해당 닉네임의 차량이 있으면 fail을 반환하고 
	 * 차량이 없어 등록가능하면 O를 반환한다.
	 */
	@Override
	public String carNickNameCheck(String carNickName) {
		CarVO vo = carDAO.carNickNameCheck(carNickName);
		if (vo != null) {
			return "fail";
		}
		return "O";
	}
	/**
	 * 모든 차량 목록을 반환한다.
	 */
	public List<CarVO> getAllCarList() {
		return carDAO.getAllCarList();
	}
	/**
	 * 유카존을 등록하는 메서드 
	 */
	public void registerUCarZone(UCarZoneVO zvo) {
		carDAO.registerUCarZone(zvo);
	}
	/**
	 * 모든 유카존 목록을 반화하는 메서드
	 */
	public List<UCarZoneVO> getAllUCarZoneList() {
		return carDAO.getAllUCarZoneList();
	}
	/**
	 * 유카존이름 중복검사 메서드 
	 * 만약DB에 해당이름의 유카존이 존재하면 true를 반환하고 
	 * 존재하지 않으면false를 반환한다. 
	 */
	public boolean uCarZoneNameCheck(String uCarZoneName) {
		boolean flag = false;
		UCarZoneVO zvo = carDAO.uCarZoneNameCheck(uCarZoneName);
		if (zvo != null) {// 존재하면
			flag = true;
		}
		return flag;
	}
	/**
	 * 유카존 검색 메서드
	 */
	public List<String> searchUCarZone(String term) {
		return carDAO.searchUCarZone(term);
	}
	/**
	 * DB에 해당 유카존이 존재하는지 확인하는 메서드 
	 */
	@Override
	public UCarZoneVO checkUCarZone(String uCarZoneName) {

		return carDAO.checkUCarZone(uCarZoneName);
	}
	/**
	 * 번호로 차량을 검색하는 메서드 
	 */
	@Override
	public CarVO findCarByNo(int carNo) {
		return carDAO.findCarByNo(carNo);

	}
	/**
	 * 차 정보를 업데이트 하는 메서드
	 */
	public void updateCar(CarVO cvo) {
		carDAO.updateCar(cvo);
	}
	/**
	 * 해당 차량을 삭제하는 메서드
	 */
	public void deleteCar(int carNo) {
		carDAO.deleteCar(carNo);
	}
	/**
	 * 차번호를 통해 차 상세정보를 가져오는 메서드 
	 */
	@Override
	public CarVO getCarDetailInfoByCarNo(int carNo) {
		return carDAO.getCarDetailInfoByCarNo(carNo);
	}
	/**
	 * 모든 차량 모델의 목록을 반환하는 메서드
	 */
	public List<String> getCarModelList() {
		return carDAO.getCarModelList();
	}
	/**
	 * 차량목록에서 조건별 검색을 하기 위한 메서드 
	 * 차량 모델, 위치하고 있는 유카존, 차량 닉네임 3가지 입력의 
	 * 8가지 조합으로 검색이 가능하다.
	 */
	@Override
	public List<CarVO> searchCarByCondition(CarVO cvo) {
		String model = cvo.getCarModelInfoVO().getCarModel();
		String uCarZone = cvo.getuCarZoneVO().getuCarZoneName();
		String nickName = cvo.getCarNickName();
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
	/**
	 * 유카존을 삭제하는 메서드 
	 */
	@Override
	public void deleteUcarZone(String uCarZoneName) {
		carDAO.deleteUcarZone(uCarZoneName);

	}
	/**
	 * 유카존을 삭제할 때 해당 유카존에 차량이 존재하면
	 * 삭제 할 수 없도록 차량 존재 유무를 확인하는 메서드 
	 */
	@Override
	public List<CarVO> searchCarByUCarZoneName(String uCarZoneName) {
		return carDAO.searchCarByUCarZoneName(uCarZoneName);
	}
	/**
	 * 유카존 정보를 수정하는 메서드 
	 */
	@Override
	public void updateUcarZone(UCarZoneVO zvo) {
		carDAO.updateUcarZone(zvo);
	}
	/**
	 * 차량 모델이름 중복체크 하는 메서드 
	 */
	@Override
	public CarModelInfoVO carModelNameCheck(String modelName) {
		return carDAO.carModelNameCheck(modelName);
	}
	/**
	 * 모든 모델 목록을 반환하는 메서드 
	 */
	@Override
	public List<CarModelInfoVO> getAllModelList() {
		return carDAO.getAllModelList();
	}
	/**
	 * 해당 모델의 상세정보를 반환하는 메서드
	 */
	@Override
	public CarModelInfoVO getModelDetailInfo(String carModel) {
		CarModelInfoVO carModelVO = carDAO.getMdoelDetailInfo(carModel);
		carModelVO.setCarOption(carDAO.getModelOption(carModel));
		return carModelVO;
	}
	/**
	 * 차량모델과 옵션을 함께 지우는 메서드
	 */
	@Override
	@Transactional
	public void deleteCarModelAndOption(String carModel) {
		carDAO.deleteCarModel(carModel);
		carDAO.deleteCarOption(carModel);
	}
	/**
	 * 차량 모델 등록 메서드 
	 * 이때 차량 모델, 옵션, 사진등록을 transaction처리한다.
	 */
	@Transactional
	public void registerCarModelAndOption(CarModelInfoVO carModelInfoVO,
			CarPicVO carPicVO, CarOptionVO carOptionVO) {
		
		carDAO.registerCarModel(carModelInfoVO);
		if (carOptionVO.getOptionComp() != null
				|| carOptionVO.getOptionInfo().size() != 0) {
			for (int i = 0; i < carOptionVO.getoptionInfo().size(); i++) {
				carOptionVO.setOptionComp(carOptionVO.getoptionInfo().get(i));
				carDAO.registerCarOption(carOptionVO);
			}
		}
		MultipartFile file = carPicVO.getFile();
		carPicVO.setCarModel(carModelInfoVO.getCarModel());
		String fileOriginalName = file.getOriginalFilename();
		String fileName = "";
		File picFile = new File(uploadCarPicPath);
		if (!picFile.exists()) {
			picFile.mkdirs();
		}
		if (!fileOriginalName.equals("")) {
			try {
				fileName = System.currentTimeMillis() + fileOriginalName;

				carPicVO.setOriginalName(fileOriginalName);
				carPicVO.setFilePath(viewCarPath + fileName);
				carDAO.registerCarPic(carPicVO);
				file.transferTo(new File(uploadCarPicPath + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 차량 모델을 삭제할 때 그 모델에 해당하는 차량이 존재하는지를 
	 * 확인하지 위한 메서드 
	 */
	public boolean modelDeleteCheck(String carModel) {
		boolean flag = false;
		List<CarVO> list = carDAO.modelDeleteCheck(carModel);
		if (list == null || list.size() == 0) {// 존재x 삭제가능
			flag = true;
		}
		return flag;
	}
}
