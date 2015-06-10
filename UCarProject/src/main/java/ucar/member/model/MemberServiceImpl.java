package ucar.member.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
<<<<<<< HEAD
	@Resource(name="memberDAOImpl")
	private MemberDAO memberDAO;	
	
	/* (non-Javadoc)
	 * @see ucar.member.model.MemberService#memberRegister(ucar.member.model.MemberVO)
	 */
	@Override
	public String memberRegister(MemberVO vo) {
		memberDAO.memberRegister(vo);
		return "등록성공";
	}

	@Override
	public MemberVO login(MemberVO vo) {
		MemberVO mvo = memberDAO.loginByIdCheck(vo);
		return mvo;
=======
	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return memberDAO.loginMember(mvo);
	}

	@Override
	public void registerMember(MemberVO mvo) {
		memberDAO.registerMember(mvo);
>>>>>>> branch 'master' of https://github.com/kostaskghero/UCarProject.git
	}
}
