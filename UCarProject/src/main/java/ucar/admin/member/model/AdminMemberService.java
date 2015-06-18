package ucar.admin.member.model;

import java.util.List;

import ucar.member.model.MemberVO;

public interface AdminMemberService {
	public List<MemberVO> getAllMemberList();
	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId);
	public void adminDeleteMember(String memberId);
}
