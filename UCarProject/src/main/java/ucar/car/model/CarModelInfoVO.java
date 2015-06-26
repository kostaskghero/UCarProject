package ucar.car.model;

import java.util.List;

public class CarModelInfoVO {
	private String carModel;
	private String carType;
	private int rentalFee;
	private int drivingFee;
	private String carPhoto;
	private String oilType;
	private List<String> carOption;

	public CarModelInfoVO(String carModel, String carType, int rentalFee,
			int drivingFee, String carPhoto, String oilType,
			CarOptionVO carOptionVO) {
		super();
		this.carModel = carModel;
		this.carType = carType;
		this.rentalFee = rentalFee;
		this.drivingFee = drivingFee;
		this.carPhoto = carPhoto;
		this.oilType = oilType;
	}

	public CarModelInfoVO(String carModel, String carType, int rentalFee,
			int drivingFee, String carPhoto, String oilType,
			List<String> carOption) {
		super();
		this.carModel = carModel;
		this.carType = carType;
		this.rentalFee = rentalFee;
		this.drivingFee = drivingFee;
		this.carPhoto = carPhoto;
		this.oilType = oilType;
		this.carOption = carOption;
	}

	public List<String> getCarOption() {
		return carOption;
	}

	public void setCarOption(List<String> carOption) {
		this.carOption = carOption;
	}

	public CarModelInfoVO() {
		super();
	}

	public CarModelInfoVO(String carModel) {
		super();
		this.carModel = carModel;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public CarModelInfoVO(String carModel, String carType, int rentalFee,
			int drivingFee, String carPhoto, String oilType) {
		super();
		this.carModel = carModel;
		this.carType = carType;
		this.rentalFee = rentalFee;
		this.drivingFee = drivingFee;
		this.carPhoto = carPhoto;
		this.oilType = oilType;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public int getRentalFee() {
		return rentalFee;
	}

	public void setRentalFee(int rentalFee) {
		this.rentalFee = rentalFee;
	}

	public int getDrivingFee() {
		return drivingFee;
	}

	public void setDrivingFee(int drivingFee) {
		this.drivingFee = drivingFee;
	}

	public String getCarPhoto() {
		return carPhoto;
	}

	public void setCarPhoto(String carPhoto) {
		this.carPhoto = carPhoto;
	}

	public String getOilType() {
		return oilType;
	}

	public void setOilType(String oilType) {
		this.oilType = oilType;
	}

	@Override
	public String toString() {
		return "CarModelInfoVO [carModel=" + carModel + ", carType=" + carType
				+ ", rentalFee=" + rentalFee + ", drivingFee=" + drivingFee
				+ ", carPhoto=" + carPhoto + ", oilType=" + oilType
				+ ", carOption=" + carOption + "]";
	}

}
