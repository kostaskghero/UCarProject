package ucar.common.pointhistory.model;

public class PointHistoryVO {
	private int pointHistoryNo;
	private String memberId;
	private double pointValue;
	private String pointDate;
	private String pointContent;
	private String pointType;
	public PointHistoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PointHistoryVO(int pointHistoryNo, String memberId,
			double pointValue, String pointDate, String pointContent,
			String pointType) {
		super();
		this.pointHistoryNo = pointHistoryNo;
		this.memberId = memberId;
		this.pointValue = pointValue;
		this.pointDate = pointDate;
		this.pointContent = pointContent;
		this.pointType = pointType;
	}
	public int getPointHistoryNo() {
		return pointHistoryNo;
	}
	public void setPointHistoryNo(int pointHistoryNo) {
		this.pointHistoryNo = pointHistoryNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public double getPointValue() {
		return pointValue;
	}
	public void setPointValue(double pointValue) {
		this.pointValue = pointValue;
	}
	public String getPointDate() {
		return pointDate;
	}
	public void setPointDate(String pointDate) {
		this.pointDate = pointDate;
	}
	public String getPointContent() {
		return pointContent;
	}
	public void setPointContent(String pointContent) {
		this.pointContent = pointContent;
	}
	public String getPointType() {
		return pointType;
	}
	public void setPointType(String pointType) {
		this.pointType = pointType;
	}
	@Override
	public String toString() {
		return "PointHistoryVO [pointHistoryNo=" + pointHistoryNo
				+ ", memberId=" + memberId + ", pointValue=" + pointValue
				+ ", pointDate=" + pointDate + ", pointContent=" + pointContent
				+ ", pointType=" + pointType + "]";
	}
}
