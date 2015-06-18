package ucar.sharing.payment.model;

public class PaymentVO {
	private int paymentNo;
	private int reservationNo;
	private int paymentPrice;
	private String paymentCardNo;
	private String paymentStatus;
	private int usingPoint;
	private String paymentType;
	public PaymentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentVO(int paymentNo, int reservationNo, int paymentPrice,
			String paymentCardNo, String paymentStatus, int usingPoint,
			String paymentType) {
		super();
		this.paymentNo = paymentNo;
		this.reservationNo = reservationNo;
		this.paymentPrice = paymentPrice;
		this.paymentCardNo = paymentCardNo;
		this.paymentStatus = paymentStatus;
		this.usingPoint = usingPoint;
		this.paymentType = paymentType;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public String getPaymentCardNo() {
		return paymentCardNo;
	}
	public void setPaymentCardNo(String paymentCardNo) {
		this.paymentCardNo = paymentCardNo;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public int getUsingPoint() {
		return usingPoint;
	}
	public void setUsingPoint(int usingPoint) {
		this.usingPoint = usingPoint;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	@Override
	public String toString() {
		return "PaymentVO [paymentNo=" + paymentNo + ", reservationNo="
				+ reservationNo + ", paymentPrice=" + paymentPrice
				+ ", paymentCardNo=" + paymentCardNo + ", paymentStatus="
				+ paymentStatus + ", usingPoint=" + usingPoint
				+ ", paymentType=" + paymentType + "]";
	}
}
