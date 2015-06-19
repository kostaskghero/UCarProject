package ucar.sharing.reservation.model;

public class ReturnVO {
	private int drivingPrice;
	private int mileage;
	private String returnUcarZone;
	private String realReturnDate;
	public ReturnVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReturnVO(int drivingPrice, int mileage, String returnUcarZone,
			String realReturnDate) {
		super();
		this.drivingPrice = drivingPrice;
		this.mileage = mileage;
		this.returnUcarZone = returnUcarZone;
		this.realReturnDate = realReturnDate;
	}
	public int getDrivingPrice() {
		return drivingPrice;
	}
	public void setDrivingPrice(int drivingPrice) {
		this.drivingPrice = drivingPrice;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getReturnUcarZone() {
		return returnUcarZone;
	}
	public void setReturnUcarZone(String returnUcarZone) {
		this.returnUcarZone = returnUcarZone;
	}
	public String getRealReturnDate() {
		return realReturnDate;
	}
	public void setRealReturnDate(String realReturnDate) {
		this.realReturnDate = realReturnDate;
	}
	@Override
	public String toString() {
		return "ReturnVO [drivingPrice=" + drivingPrice + ", mileage="
				+ mileage + ", returnUcarZone=" + returnUcarZone
				+ ", realReturnDate=" + realReturnDate + "]";
	}
}
