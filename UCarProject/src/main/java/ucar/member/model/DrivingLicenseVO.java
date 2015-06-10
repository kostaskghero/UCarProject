package ucar.member.model;

public class DrivingLicenseVO {
	private String licenseNo;
	private String memberId;
	private String licenseType;
	private String licenseRenewalTerm;
	private String licenseIssueDate;
	private String gender;
	public DrivingLicenseVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DrivingLicenseVO(String licenseNo, String memberId,
			String licenseType, String licenseRenewalTerm,
			String licenseIssueDate, String gender) {
		super();
		this.licenseNo = licenseNo;
		this.memberId = memberId;
		this.licenseType = licenseType;
		this.licenseRenewalTerm = licenseRenewalTerm;
		this.licenseIssueDate = licenseIssueDate;
		this.gender = gender;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getLicenseType() {
		return licenseType;
	}
	public void setLicenseType(String licenseType) {
		this.licenseType = licenseType;
	}
	public String getLicenseRenewalTerm() {
		return licenseRenewalTerm;
	}
	public void setLicenseRenewalTerm(String licenseRenewalTerm) {
		this.licenseRenewalTerm = licenseRenewalTerm;
	}
	public String getLicenseIssueDate() {
		return licenseIssueDate;
	}
	public void setLicenseIssueDate(String licenseIssueDate) {
		this.licenseIssueDate = licenseIssueDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "DrivingLicense [licenseNo=" + licenseNo + ", memberId="
				+ memberId + ", licenseType=" + licenseType
				+ ", licenseRenewalTerm=" + licenseRenewalTerm
				+ ", licenseIssueDate=" + licenseIssueDate + ", gender="
				+ gender + "]";
	}
}
