package ucar.member.model;

public interface MemberDAO {

<<<<<<< HEAD
	public abstract void memberRegister(MemberVO vo);

	public abstract MemberVO loginByIdCheck(MemberVO vo);

}
=======
	public MemberVO loginMember(MemberVO mvo);

	public void registerMember(MemberVO mvo);

}
>>>>>>> branch 'master' of https://github.com/kostaskghero/UCarProject.git
