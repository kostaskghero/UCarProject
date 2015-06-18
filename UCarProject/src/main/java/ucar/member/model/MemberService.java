package ucar.member.model;

import java.util.HashMap;
import java.util.List;


public interface MemberService {

	public MemberVO loginMember(MemberVO mvo);

	public void registerMember(MemberVO mvo);

	public String memberIdCheck(String memberId) throws Exception;

	public List<String> getAllLicenseLocationList();

	public int deleteMember(MemberVO memberVO);

	public void registerLicense(MemberVO memberVO) throws Exception;

	public void registerCard(MemberVO memberVO) throws Exception;

	public MemberVO updateMember(MemberVO memberVO);

	public HashMap<String,Object> updateMemberPassword(String oriMemberPassword, MemberVO memberVO);

	public MemberVO findLicenseInfoByMemberId(String memberId);

	public List<MemberVO> findCardInfoByMemberId(String memberId);

	public String countCardByMemberId(String memberId) throws Exception;

	public HashMap<String, Object> findPointAndCouponByMemberId(String memberId);

}
