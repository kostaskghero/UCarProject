package ucar.member.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.common.pointhistory.model.PointHistoryVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * member Table 에서 memberVO 의 memberId 와 memberPassword 가 일치하는 회원정보를 조회한다.
	 */
	@Override
	public MemberVO loginMember(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("member.loginMember", memberVO);
	}
	
	/**
	 * member Table 에 memberVO 의 정보를 삽입한다.
	 */
	@Override
	public void registerMember(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerMember", memberVO);
	}
	
	/**
	 * member Table 에 memberId 와 일치하는 정보가 있는지 조회한다.
	 * 없으면 ok 를 있으면 fail 을 반환
	 */
	@Override
	public String memberIdCheck(String memberId) {
		int count=sqlSessionTemplate.selectOne("member.memberIdCheck",memberId);
		return (count==0)? "ok":"fail";
	}
	
	/**
	 * card Table 에 memberId 를 외래키로 memberVO 의 정보를 삽입한다.
	 */
	@Override
	public void registerCard(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerCard", memberVO);
	}
	
	/**
	 * card Table 에 cardNo와 일치하는 정보가 있는지 조회한다.
	 */
	@Override
	public MemberVO findCardInfoByCardNo(String cardNo) {
		return sqlSessionTemplate.selectOne("member.findCardInfoByCardNo",cardNo);
	}
	/**
	 * card Table 에 cardNo 와 일치하는 정보를 삭제한다.
	 */
	@Override
	public int deleteCard(String cardNo) {
		return sqlSessionTemplate.delete("member.deleteCard", cardNo);
	}
	
	/**
	 * member Table 에 memberId 와 일치하는 정보의 값을 변경한다.
	 */
	@Override
	public int updateMemberInfo(MemberVO memberVO) {
		return sqlSessionTemplate.update("member.updateMemberInfo", memberVO);
	}
	
	/**
	 * member Table 에 memberId 와 일치하는 정보를 삭제한다.
	 */
	@Override
	public int deleteMember(String memberId) {
		return sqlSessionTemplate.delete("member.deleteMember", memberId);
		
	}
	
	/**
	 * member Table 에서 memberId 에 해당하는 정보를 조회한다.
	 */
	@Override
	public MemberVO findMemberInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.findMemberInfoByMemberId", memberId);
	}
	
	/**
	 * driving_license Table 에서 licenseNo 와 일치하는 정보를 조회한다.
	 */
	@Override
	public MemberVO findLicenseInfoByLicenseNo(String licenseNo) {
		return sqlSessionTemplate.selectOne("member.findLicenseInfoByLicenseNo", licenseNo);
	}
	
	/**
	 * driving_license Table 에 memberId 를 외래키로 memberVO 의 정보를 삽입한다.
	 */
	@Override
	public void registerLicense(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerLicense", memberVO);
	}
	
	/**
	 * member Table 에서 아이디와 비밀번호 일치하는 정보가 있는지 조회한다.
	 * 있으면 ok 를 없으면 fail 을 반환한다.
	 */
	@Override
	public String memberPasswordCheck(MemberVO memberVO) {
		int count=sqlSessionTemplate.selectOne("member.memberPasswordCheck", memberVO);
		return (count==1)? "ok":"fail";
	}
	
	/**
	 * member Tabel 에서 memberId 에 해당하는 정보의 비밀번호를 변경한다.
	 */
	@Override
	public int updateMemberPassword(MemberVO memberVO) {
		return sqlSessionTemplate.update("member.updateMemberPassword", memberVO);
	}
	
	/**
	 * license_location Table 의 정보를 모두 조회한다.
	 */
	@Override
	public List<String> getAllLicenseLocationList() {
		return sqlSessionTemplate.selectList("member.getAllLicenseLocationList");
	}
	
	/**
	 * card Table 에서 memberId 를 외래키로 갖는 정보를 삭제한다.
	 */
	@Override
	public void deleteCardByMemberId(String memberId) {
		sqlSessionTemplate.delete("member.deleteCardByMemberId", memberId);
	}

	/**
	 * driving_licen Table 에서 memberId 를 외래키로 갖는 정보를 삭제한다.
	 */
	@Override
	public void deleteLicenseByMemberId(String memberId) {
		sqlSessionTemplate.delete("member.deleteLicenseByMemberId", memberId);
	}
	/**
	 * driving_license Table 에서 memberId 에 해당하는 면허정보를 조회한다.
	 */
	@Override
	public MemberVO findLicenseInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.findLicenseInfoByMemberId", memberId);
	}
	
	/**
	 * card Table 에서 memberId 에 해당하는 결제카드 정보를 조회한다.
	 */
	@Override
	public List<MemberVO> findCardInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectList("member.findCardInfoByMemberId", memberId);
	}
	
	/**
	 * card Table 에서 memberId 에 해당하는 결제카드의 수를 조회한다.
	 */
	@Override
	public int countCardByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.countCardByMemberId", memberId);
	}

	@Override
	public int findPointByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.findPointByMemberId", memberId);
	}
	
	/**
	 * point_history Table 에서 memberId 를 외래키로 가지는 정보를 조회한다.
	 */
	@Override
	public List<PointHistoryVO> getPointListByMemberId(PointHistoryVO pointHistoryVO) {
		return sqlSessionTemplate.selectList("member.getPointListByMemberId", pointHistoryVO);
	}
	
	/**
	 * point_history Table 에서 memberId 를 외래키로 가지는 정보의 수를 조회한다.
	 */
	@Override
	public int totalPointHistoryByMemberId(PointHistoryVO pointHistoryVO) {
		return sqlSessionTemplate.selectOne("member.totalPointHistoryByMemberId", pointHistoryVO);
	}
	
	/**
	 * member Table 에서 입력된 정보와 일치하는 아이디를 조회한다.
	 */
	@Override
	public MemberVO findMemberId(MemberVO vo){
		return sqlSessionTemplate.selectOne("member_findMemberId",vo);
	}
	
	/**
	 * member Table 에서 입력된 정보와 일치하는 아이디의 비밀번호를 조회한다.
	 */
	@Override
	public MemberVO findMemberPassword(MemberVO vo){
		return sqlSessionTemplate.selectOne("member_findMemberPassword",vo);
	}
	
	
}
