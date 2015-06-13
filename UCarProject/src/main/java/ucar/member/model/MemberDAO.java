package ucar.member.model;

import java.util.List;

public interface MemberDAO {

	public MemberVO loginMember(MemberVO memberVO);

	public void registerMember(MemberVO memberVO);

	public String memberIdCheck(String memberId);
	
	public int updateMemberInfo(MemberVO memberVO);
	
	public int deleteMember(String memberId);
	
	public MemberVO findMemberInfoByMemberId(String memberId);
	
	public void registerCard(MemberVO memberVO);
	
	public MemberVO findCardInfoByCardNo(String cardNo);
	
	public int updateCardInfo(MemberVO memberVO);
	
	public int deleteCard(String cardNo);
	
	public MemberVO findLicenseInfoByLicenseNo(String licenseNo);
	
	public void registerLicense(MemberVO memberVO);
	
	public int updateLicenseInfo(MemberVO memberVO);
	
	public int deleteLicense(String licenseNo);
	
	public String memberPasswordCheck(MemberVO memberVO);
	
	public int updateMemberPassword(MemberVO memberVO);
	
	public List<String> getAllLicenseLocationList();

	public void deleteCardByMemberId(String memberId);

	public void deleteLicenseByMemberId(String memberId);

	public MemberVO findLicenseInfoByMemberId(String memberId);

	public List<MemberVO> findCardInfoByMemberId(String memberId);

	public int countCardByMemberId(String memberId);

}
