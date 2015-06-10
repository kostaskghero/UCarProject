package ucar.member.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
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
	}
}
