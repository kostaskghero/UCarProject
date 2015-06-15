package ucar.car.model;

public class UCarZoneVO {
	private String uCarZoneName;
	private String uCarZoneAddress;

	@Override
	public String toString() {
		return "UCarZoneVO [uCarZoneName=" + uCarZoneName
				+ ", uCarZoneAddress=" + uCarZoneAddress + "]";
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
