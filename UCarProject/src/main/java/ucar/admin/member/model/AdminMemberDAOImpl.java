package ucar.admin.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.MemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MemberVO> getAllMemberList() {
		return sqlSessionTemplate.selectList("adminMember.getAllMemberList");
	}

	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectList(
				"adminMember.findDetailMemberInfoByMemberId", memberId);
	}

	@Override
	public MemberVO findDetailMemberInfoAndLicenseByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne(
				"adminMember.findDetailMemberInfoAndLicenseByMemberId",
				memberId);

	}

	@Override
	public List<MemberVO> findDetailMemberInfoAndCardByMemberId(String memberId) {
		return sqlSessionTemplate.selectList(
				"adminMember.findDetailMemberInfoAndCardByMemberId", memberId);

	}

	@Override
	public void adminDeleteMember(String memberId) {
		sqlSessionTemplate.delete("adminMember.adminDeleteMember", memberId);

	}

	public List<PointHistoryVO> getAllPointHistory(String pageNo) {
		return sqlSessionTemplate.selectList("adminMember.getAllPointHistory",
				pageNo);
	}

	public int getTotalPointHistory() {
		return sqlSessionTemplate.selectOne("adminMember.getTotalPointHistory");
	}

	public List<PointHistoryVO> getAllPointHistoryById(String memberId,
			String pageNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectList(
				"adminMember.getAllPointHistoryById", map);
	}

	@Override
	public int getTotalPointHistoryById(String memberId) {
		return sqlSessionTemplate.selectOne(
				"adminMember.getTotalPointHistoryById", memberId);
	}
}
