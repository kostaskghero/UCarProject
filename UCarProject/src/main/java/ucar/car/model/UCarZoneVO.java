package ucar.car.model;

public class UCarZoneVO {
	private String uCarZoneName;
	private String uCarZoneAddress;
	private double latitude;//위도
	private double longitude;//경도
	
	
	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public UCarZoneVO(String uCarZoneName, String uCarZoneAddress,
			double latitude, double longitude) {
		super();
		this.uCarZoneName = uCarZoneName;
		this.uCarZoneAddress = uCarZoneAddress;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "UCarZoneVO [uCarZoneName=" + uCarZoneName
				+ ", uCarZoneAddress=" + uCarZoneAddress + ", latitude="
				+ latitude + ", longitude=" + longitude + "]";
	}

	public String getuCarZoneName() {
		return uCarZoneName;
	}

	public void setuCarZoneName(String uCarZoneName) {
		this.uCarZoneName = uCarZoneName;
	}

	public String getuCarZoneAddress() {
		return uCarZoneAddress;
	}

	public void setuCarZoneAddress(String uCarZoneAddress) {
		this.uCarZoneAddress = uCarZoneAddress;
	}

	public UCarZoneVO(String uCarZoneName, String uCarZoneAddress) {
		super();
		this.uCarZoneName = uCarZoneName;
		this.uCarZoneAddress = uCarZoneAddress;
	}

	public UCarZoneVO() {
		super();
	}
}
