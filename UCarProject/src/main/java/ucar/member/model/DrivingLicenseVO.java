package ucar.member.model;


public class DrivingLicenseVO {
	private String licenseNo;
	private String licenseType;
	private String licenseRenewalTerm;
	private String licenseIssueDate;
	private String gender;
	private String licenseBirth;
	public DrivingLicenseVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DrivingLicenseVO(String licenseNo, String licenseType,
			String licenseRenewalTerm, String licenseIssueDate, String gender,
			String licenseBirth) {
		super();
		this.licenseNo = licenseNo;
		this.licenseType = licenseType;
		this.licenseRenewalTerm = licenseRenewalTerm;
		this.licenseIssueDate = licenseIssueDate;
		this.gender = gender;
		this.licenseBirth = licenseBirth;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
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
	public String getLicenseBirth() {
		return licenseBirth;
	}
	public void setLicenseBirth(String licenseBirth) {
		this.licenseBirth = licenseBirth;
	}
	@Override
	public String toString() {
		return "DrivingLicenseVO [licenseNo=" + licenseNo + ", licenseType="
				+ licenseType + ", licenseRenewalTerm=" + licenseRenewalTerm
				+ ", licenseIssueDate=" + licenseIssueDate + ", gender="
				+ gender + ", licenseBirth=" + licenseBirth + "]";
	}	
}
