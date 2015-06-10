package ucar.member.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	
	public MemberVO login(MemberVO vo){
		return memberDAO.login(vo);
	}
	public void registerMember(MemberVO vo){
	memberDAO.registerMember(vo);
	}
	public MemberVO findMemberById(String id){
		return memberDAO.findMemberById(id);
	}
}
