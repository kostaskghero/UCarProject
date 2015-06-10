package ucar.member.model;

public interface MemberService {

	public abstract String memberRegister(MemberVO vo);

	public abstract MemberVO login(MemberVO vo);

}