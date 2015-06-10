package ucar.member.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
<<<<<<< HEAD
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see ucar.member.model.MemberDAO#memberRegister(ucar.member.model.MemberVO)
	 */
	@Override
	public void memberRegister(MemberVO vo){
		System.out.println("test");
		sqlSessionTemplate.insert("member.registerMember", vo);
	}

	@Override
	public MemberVO loginByIdCheck(MemberVO vo) {
		
		return sqlSessionTemplate.selectOne("member.loginByIdCheck", vo);
	}
=======
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return sqlSessionTemplate.selectOne("member.loginMember", mvo);
	}

	@Override
	public void registerMember(MemberVO mvo) {
		sqlSessionTemplate.insert("member.registerMember", mvo);
	}
	
>>>>>>> branch 'master' of https://github.com/kostaskghero/UCarProject.git
}
