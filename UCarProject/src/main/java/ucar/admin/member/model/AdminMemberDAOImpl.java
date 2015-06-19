package ucar.admin.member.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.member.model.MemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MemberVO> getAllMemberList() {
		return sqlSessionTemplate.selectList("adminMember.getAllMemberList");
	}
	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId){
		return sqlSessionTemplate.selectList("adminMember.findDetailMemberInfoByMemberId",memberId);
	}
	@Override
	public MemberVO findDetailMemberInfoAndLicenseByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("adminMember.findDetailMemberInfoAndLicenseByMemberId",memberId);

	}
	@Override
	public List<MemberVO> findDetailMemberInfoAndCardByMemberId(String memberId) {
		return sqlSessionTemplate.selectList("adminMember.findDetailMemberInfoAndCardByMemberId",memberId);

	}
	@Override
	public void adminDeleteMember(String memberId) {
		sqlSessionTemplate.delete("adminMember.adminDeleteMember",memberId);
		
	}
}