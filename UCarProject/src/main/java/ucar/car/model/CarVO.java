package ucar.car.model;

public class CarVO {
	private int carNo;
	private String carNickName;
	private UCarZoneVO uCarZoneVO;
	private CarModelInfoVO carModelInfoVO;
	private boolean available;
	public CarVO() {
		super();
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public CarVO(int carNo, String carNickName, UCarZoneVO uCarZoneVO,
			CarModelInfoVO carModelInfoVO, boolean available) {
		super();
		this.carNo = carNo;
		this.carNickName = carNickName;
		this.uCarZoneVO = uCarZoneVO;
		this.carModelInfoVO = carModelInfoVO;
		this.available = available;
	}

	public CarVO(String carNickName, UCarZoneVO uCarZoneVO,
			CarModelInfoVO carModelInfoVO) {
		super();
		this.carNickName = carNickName;
		this.uCarZoneVO = uCarZoneVO;
		this.carModelInfoVO = carModelInfoVO;
	}

	public CarVO(int carNo, String carNickName, UCarZoneVO uCarZoneVO,
			CarModelInfoVO carModelInfoVO) {
		super();
		this.carNo = carNo;
		this.carNickName = carNickName;
		this.uCarZoneVO = uCarZoneVO;
		this.carModelInfoVO = carModelInfoVO;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public String getCarNickName() {
		return carNickName;
	}

	public void setCarNickName(String carNickName) {
		this.carNickName = carNickName;
	}

	public UCarZoneVO getuCarZoneVO() {
		return uCarZoneVO;
	}

	public void setuCarZoneVO(UCarZoneVO uCarZoneVO) {
		this.uCarZoneVO = uCarZoneVO;
	}

	public CarModelInfoVO getCarModelInfoVO() {
		return carModelInfoVO;
	}

	public void setCarModelInfoVO(CarModelInfoVO carModelInfoVO) {
		this.carModelInfoVO = carModelInfoVO;
	}

	@Override
	public String toString() {
		return "CarVO [carNo=" + carNo + ", carNickName=" + carNickName
				+ ", uCarZoneVO=" + uCarZoneVO + ", carModelInfoVO="
				+ carModelInfoVO + ", available=" + available + "]";
	}

}
