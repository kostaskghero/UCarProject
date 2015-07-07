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
	/**
	 * member 테이블의 모든 정보를 가져오는 메서드 
	 */
	@Override
	public List<MemberVO> getAllMemberList() {
		return sqlSessionTemplate.selectList("adminMember.getAllMemberList");
	}
	/**
	 * 해당아이디에 해당하는 정보를 면허와 카드 테이블에서 조인은 사용하여 가져온다. 
	 * 
	 */
	@Override
	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectList(
				"adminMember.findDetailMemberInfoByMemberId", memberId);
	}
	/**
	 * 아이디로 멤버와 면허테이블에서 정보를 가져온다.
	 */
	@Override
	public MemberVO findDetailMemberInfoAndLicenseByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne(
				"adminMember.findDetailMemberInfoAndLicenseByMemberId",
				memberId);

	}
	/**
	 * 아이디로 멤버와 결제카드 테이블에서 정보를 가져온다.
	 */
	@Override
	public List<MemberVO> findDetailMemberInfoAndCardByMemberId(String memberId) {
		return sqlSessionTemplate.selectList(
				"adminMember.findDetailMemberInfoAndCardByMemberId", memberId);

	}
	/**
	 * 멤버테이블에 해당아이디의 정보를 삭제
	 */
	@Override
	public void adminDeleteMember(String memberId) {
		sqlSessionTemplate.delete("adminMember.adminDeleteMember", memberId);

	}
	/**
	 * 포인트 내역 테이블에서 해당 페이지에 해당하는 모든 포인트 내역정보를 가져온다. 
	 * 
	 */
	@Override
	public List<PointHistoryVO> getAllPointHistory(String pageNo) {
		return sqlSessionTemplate.selectList("adminMember.getAllPointHistory",
				pageNo);
	}
	/**
	 * 페이징빈에 필요한 메서드. 모든 포인트내역의 개수를 반환한다.
	 */
	@Override
	public int getTotalPointHistory() {
		return sqlSessionTemplate.selectOne("adminMember.getTotalPointHistory");
	}
	/**
	 * 아이디별로 검색하여 해당페이지에 대한 아이디별 포인트내역을 반환한다.
	 * 아이디와 페이지번호를 map에 넣어 넘겨준다.
	 */
	@Override
	public List<PointHistoryVO> getAllPointHistoryById(String memberId,
			String pageNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectList(
				"adminMember.getAllPointHistoryById", map);
	}
	/**
	 * 페이징빈 처리를 위해 해당아이디의 포인트내역의 개수를 반환한다.
	 */
	@Override
	public int getTotalPointHistoryById(String memberId) {
		return sqlSessionTemplate.selectOne(
				"adminMember.getTotalPointHistoryById", memberId);
	}
	/**
	 * 포인트 내역 테이블에 운영자지급포인트를 기록남긴다.
	 */
	@Override
	public void givePointByAdminHistory(PointHistoryVO phvo) {
	sqlSessionTemplate.insert("point.insertPointHistory",phvo);
	}
	/**
	 * member테이블에서 해당아이디의 포인트를 지급한 만큼 올려준다. 
	 */
	@Override
	public void givePointByAdminUpdate(MemberVO mvo){
		sqlSessionTemplate.update("adminMember.givePointByAdminUpdate",mvo);
	}
}
