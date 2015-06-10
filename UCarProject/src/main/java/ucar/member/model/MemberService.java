package ucar.member.model;

public interface MemberService {
	public MemberVO login(MemberVO vo);
	public void registerMember(MemberVO vo);
	public MemberVO findMemberById(String id);
}
