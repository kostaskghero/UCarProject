package ucar.sharing.reservation.model;

import ucar.car.model.CarVO;
import ucar.member.model.MemberVO;
import ucar.sharing.payment.model.PaymentVO;

public class ReservationVO {
	private int reservationNo;
	private String sharingType;
	private CarVO carVO;
	private MemberVO memberVO;
	private String rentalDate;
	private String rentalUcarZoneName;
	private String returnDate;
	private String returnUcarZoneName;
	private int rentalPrice;
	private String sharingStatus;
	private String availableTime;
	private String historyPageNo;
	private String extensionDate;
	private int extensionPrice;
	private long lateTime;
	private int lateFee;
	private ReturnVO returnVO;
	private PaymentVO paymentVO;
	public ReservationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationVO(int reservationNo, String sharingType, CarVO carVO,
			MemberVO memberVO, String rentalDate, String rentalUcarZoneName,
			String returnDate, String returnUcarZoneName, int rentalPrice,
			String sharingStatus, String availableTime, String historyPageNo,
			String extensionDate, int extensionPrice, int lateTime,
			int lateFee, ReturnVO returnVO, PaymentVO paymentVO) {
		super();
		this.reservationNo = reservationNo;
		this.sharingType = sharingType;
		this.carVO = carVO;
		this.memberVO = memberVO;
		this.rentalDate = rentalDate;
		this.rentalUcarZoneName = rentalUcarZoneName;
		this.returnDate = returnDate;
		this.returnUcarZoneName = returnUcarZoneName;
		this.rentalPrice = rentalPrice;
		this.sharingStatus = sharingStatus;
		this.availableTime = availableTime;
		this.historyPageNo = historyPageNo;
		this.extensionDate = extensionDate;
		this.extensionPrice = extensionPrice;
		this.lateTime = lateTime;
		this.lateFee = lateFee;
		this.returnVO = returnVO;
		this.paymentVO = paymentVO;
	}
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getSharingType() {
		return sharingType;
	}
	public void setSharingType(String sharingType) {
		this.sharingType = sharingType;
	}
	public CarVO getCarVO() {
		return carVO;
	}
	public void setCarVO(CarVO carVO) {
		this.carVO = carVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}
	public String getRentalUcarZoneName() {
		return rentalUcarZoneName;
	}
	public void setRentalUcarZoneName(String rentalUcarZoneName) {
		this.rentalUcarZoneName = rentalUcarZoneName;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getReturnUcarZoneName() {
		return returnUcarZoneName;
	}
	public void setReturnUcarZoneName(String returnUcarZoneName) {
		this.returnUcarZoneName = returnUcarZoneName;
	}
	public int getRentalPrice() {
		return rentalPrice;
	}
	public void setRentalPrice(int rentalPrice) {
		this.rentalPrice = rentalPrice;
	}
	public String getSharingStatus() {
		return sharingStatus;
	}
	public void setSharingStatus(String sharingStatus) {
		this.sharingStatus = sharingStatus;
	}
	public String getAvailableTime() {
		return availableTime;
	}
	public void setAvailableTime(String availableTime) {
		this.availableTime = availableTime;
	}
	public String getHistoryPageNo() {
		return historyPageNo;
	}
	public void setHistoryPageNo(String historyPageNo) {
		this.historyPageNo = historyPageNo;
	}
	public String getExtensionDate() {
		return extensionDate;
	}
	public void setExtensionDate(String extensionDate) {
		this.extensionDate = extensionDate;
	}
	public int getExtensionPrice() {
		return extensionPrice;
	}
	public void setExtensionPrice(int extensionPrice) {
		this.extensionPrice = extensionPrice;
	}
	public long getLateTime() {
		return lateTime;
	}
	public void setLateTime(long lateTime) {
		this.lateTime = lateTime;
	}
	public int getLateFee() {
		return lateFee;
	}
	public void setLateFee(int lateFee) {
		this.lateFee = lateFee;
	}
	public ReturnVO getReturnVO() {
		return returnVO;
	}
	public void setReturnVO(ReturnVO returnVO) {
		this.returnVO = returnVO;
	}
	public PaymentVO getPaymentVO() {
		return paymentVO;
	}
	public void setPaymentVO(PaymentVO paymentVO) {
		this.paymentVO = paymentVO;
	}
	@Override
	public String toString() {
		return "ReservationVO [reservationNo=" + reservationNo
				+ ", sharingType=" + sharingType + ", carVO=" + carVO
				+ ", memberVO=" + memberVO + ", rentalDate=" + rentalDate
				+ ", rentalUcarZoneName=" + rentalUcarZoneName
				+ ", returnDate=" + returnDate + ", returnUcarZoneName="
				+ returnUcarZoneName + ", rentalPrice=" + rentalPrice
				+ ", sharingStatus=" + sharingStatus + ", availableTime="
				+ availableTime + ", historyPageNo=" + historyPageNo
				+ ", extensionDate=" + extensionDate + ", extensionPrice="
				+ extensionPrice + ", lateTime=" + lateTime + ", lateFee="
				+ lateFee + ", returnVO=" + returnVO + ", paymentVO="
				+ paymentVO + "]";
	}
}
