package ucar.member.model;

public interface MemberDAO {

	public MemberVO loginMember(MemberVO mvo);

	public void registerMember(MemberVO mvo);

}
