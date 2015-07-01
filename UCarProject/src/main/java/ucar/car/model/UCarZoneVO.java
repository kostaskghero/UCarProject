package ucar.car.model;

public class UCarZoneVO {
	private String uCarZoneName;
	private String uCarZoneAddress;
	private String latitude;//위도
	private String longitude;//경도
	public UCarZoneVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UCarZoneVO(String uCarZoneName, String uCarZoneAddress,
			String latitude, String longitude) {
		super();
		this.uCarZoneName = uCarZoneName;
		this.uCarZoneAddress = uCarZoneAddress;
		this.latitude = latitude;
		this.longitude = longitude;
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
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "UCarZoneVO [uCarZoneName=" + uCarZoneName
				+ ", uCarZoneAddress=" + uCarZoneAddress + ", latitude="
				+ latitude + ", longitude=" + longitude + "]";
	}
}
