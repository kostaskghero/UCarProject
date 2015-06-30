package ucar.member.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberVO {
	@Size(min=4,max=10)
	private String memberId;
	@Size(min=4,max=15)
	private String memberPassword;
	@NotEmpty
	private String memberName;
	@Email
	@NotEmpty
	private String memberEmail;
	@NotEmpty
	private String memberPhone;	
	private int memberPoint;
	private String memberLevel;
	private DrivingLicenseVO drivingLicenseVO;
	private CardVO cardVO;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String memberId, String memberPassword, String memberName,
			String memberEmail, String memberPhone, int memberPoint,
			String memberLevel, DrivingLicenseVO drivingLicenseVO, CardVO cardVO) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberPoint = memberPoint;
		this.memberLevel = memberLevel;
		this.drivingLicenseVO = drivingLicenseVO;
		this.cardVO = cardVO;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
	public DrivingLicenseVO getDrivingLicenseVO() {
		return drivingLicenseVO;
	}
	public void setDrivingLicenseVO(DrivingLicenseVO drivingLicenseVO) {
		this.drivingLicenseVO = drivingLicenseVO;
	}
	public CardVO getCardVO() {
		return cardVO;
	}
	public void setCardVO(CardVO cardVO) {
		this.cardVO = cardVO;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPassword="
				+ memberPassword + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone="
				+ memberPhone + ", memberPoint=" + memberPoint
				+ ", memberLevel=" + memberLevel + ", drivingLicenseVO="
				+ drivingLicenseVO + ", cardVO=" + cardVO + "]";
	}
}
