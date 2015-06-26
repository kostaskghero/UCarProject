package ucar.car.model;

import java.util.List;

public class CarOptionVO {
	private int optionNo;
	private String carModel;
	private List<String> optionInfo;
	private String optionComp;

	public List<String> getOptionInfo() {
		return optionInfo;
	}

	public void setOptionInfo(List<String> optionInfo) {
		this.optionInfo = optionInfo;
	}

	public String getOptionComp() {
		return optionComp;
	}

	public void setOptionComp(String optionComp) {
		this.optionComp = optionComp;
	}

	public CarOptionVO(int optionNo, String carModel, List<String> optionInfo,
			String optionComp) {
		super();
		this.optionNo = optionNo;
		this.carModel = carModel;
		this.optionInfo = optionInfo;
		this.optionComp = optionComp;
	}

	public CarOptionVO() {
		super();
	}

	public CarOptionVO(int optionNo, String carModel, List<String> optionInfo) {
		super();
		this.optionNo = optionNo;
		this.carModel = carModel;
		this.optionInfo = optionInfo;
	}

	public CarOptionVO(String carModel, List<String> optionInfo) {
		super();
		this.carModel = carModel;
		this.optionInfo = optionInfo;
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public List<String> getoptionInfo() {
		return optionInfo;
	}

	public void setoptionInfo(List<String> optionInfo) {
		this.optionInfo = optionInfo;
	}

	@Override
	public String toString() {
		return "CarOptionVO [optionNo=" + optionNo + ", carModel=" + carModel
				+ ", optionInfo=" + optionInfo + ", optionComp=" + optionComp
				+ "]";
	}

}
