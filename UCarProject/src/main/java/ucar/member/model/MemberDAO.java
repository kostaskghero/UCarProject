package ucar.member.model;

public interface MemberDAO {
	public MemberVO login(MemberVO vo);
	public void registerMember(MemberVO vo) ;
	public MemberVO findMemberById(String id);
}
