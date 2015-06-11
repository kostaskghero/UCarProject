package ucar.member.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return memberDAO.loginMember(mvo);
	}

	@Override
	public void registerMember(MemberVO mvo) {

		memberDAO.registerMember(mvo);
	}
}
