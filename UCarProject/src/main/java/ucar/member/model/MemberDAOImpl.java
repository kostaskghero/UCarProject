package ucar.member.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

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
	

}
