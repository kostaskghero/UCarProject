package ucar.member.model;

public interface MemberDAO {

	public abstract void memberRegister(MemberVO vo);

	public abstract MemberVO loginByIdCheck(MemberVO vo);

}