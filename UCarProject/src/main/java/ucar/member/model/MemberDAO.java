package ucar.member.model;

import java.util.List;

import ucar.common.pointhistory.model.PointHistoryVO;

public interface MemberDAO {

	public MemberVO loginMember(MemberVO memberVO);

	public void registerMember(MemberVO memberVO);

	public String memberIdCheck(String memberId);
	
	public int updateMemberInfo(MemberVO memberVO);
	
	public int deleteMember(String memberId);
	
	public MemberVO findMemberInfoByMemberId(String memberId);
	
	public void registerCard(MemberVO memberVO);
	
	public MemberVO findCardInfoByCardNo(String cardNo);
	
	public int deleteCard(String cardNo);
	
	public MemberVO findLicenseInfoByLicenseNo(String licenseNo);
	
	public void registerLicense(MemberVO memberVO);
	
	public String memberPasswordCheck(MemberVO memberVO);
	
	public int updateMemberPassword(MemberVO memberVO);
	
	public List<String> getAllLicenseLocationList();

	public void deleteCardByMemberId(String memberId);

	public void deleteLicenseByMemberId(String memberId);

	public MemberVO findLicenseInfoByMemberId(String memberId);

	public List<MemberVO> findCardInfoByMemberId(String memberId);

	public int countCardByMemberId(String memberId);

	public int findPointByMemberId(String memberId);

	public List<PointHistoryVO> getPointListByMemberId(PointHistoryVO pointHistoryVO);

	public int totalPointHistoryByMemberId(PointHistoryVO pointHistoryVO);
	
	public MemberVO findMemberId(MemberVO vo);

	public MemberVO findMemberPassword(MemberVO vo);

}
