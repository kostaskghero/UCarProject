package ucar.member.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberVO login(MemberVO vo) {
		// System.out.println("DAO TEST : "+sqlSessionTemplate.selectOne("member.login",vo));
		return (MemberVO) sqlSessionTemplate.selectOne("member.login", vo);

	}

	public void registerMember(MemberVO vo) {
		sqlSessionTemplate.insert("member.registerMember",vo);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return (MemberVO) sqlSessionTemplate.selectOne("member.findMemberById", id);

	}
}
