package ucar.admin.member.model;

import java.util.List;

import ucar.member.model.MemberVO;

public interface AdminMemberDAO {
	public List<MemberVO> getAllMemberList();
	
	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId);
	public MemberVO findDetailMemberInfoAndLicenseByMemberId(String memberId);
	public List<MemberVO> findDetailMemberInfoAndCardByMemberId(String memberId);
	public void adminDeleteMember(String memberId);
}
