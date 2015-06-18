package ucar.member.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberVO loginMember(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("member.loginMember", memberVO);
	}

	@Override
	public void registerMember(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerMember", memberVO);
	}

	@Override
	public String memberIdCheck(String memberId) {
		int count=sqlSessionTemplate.selectOne("member.memberIdCheck",memberId);
		return (count==0)? "ok":"fail";
	}

	@Override
	public void registerCard(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerCard", memberVO);
	}

	@Override
	public MemberVO findCardInfoByCardNo(String cardNo) {
		return sqlSessionTemplate.selectOne("member.findCardInfoByCardNo",cardNo);
	}

	@Override
	public int deleteCard(String cardNo) {
		return sqlSessionTemplate.delete("member.deleteCard", cardNo);
	}

	@Override
	public int updateMemberInfo(MemberVO memberVO) {
		return sqlSessionTemplate.update("member.updateMemberInfo", memberVO);
	}

	@Override
	public int deleteMember(String memberId) {
		return sqlSessionTemplate.delete("member.deleteMember", memberId);
		
	}

	@Override
	public MemberVO findMemberInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.findMemberInfoByMemberId", memberId);
	}

	@Override
	public int updateCardInfo(MemberVO memberVO) {
		return sqlSessionTemplate.update("member.updateCardInfo", memberVO);
	}

	@Override
	public MemberVO findLicenseInfoByLicenseNo(String licenseNo) {
		return sqlSessionTemplate.selectOne("member.findLicenseInfoByLicenseNo", licenseNo);
	}

	@Override
	public void registerLicense(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerLicense", memberVO);
	}

	@Override
	public int updateLicenseInfo(MemberVO memberVO) {
		return sqlSessionTemplate.update("member.updateLicenseInfo", memberVO);
	}

	@Override
	public int deleteLicense(String licenseNo) {
		return sqlSessionTemplate.delete("member.deleteLicense", licenseNo);
	}

	@Override
	public String memberPasswordCheck(MemberVO memberVO) {
		int count=sqlSessionTemplate.selectOne("member.memberPasswordCheck", memberVO);
		return (count==1)? "ok":"fail";
	}

	@Override
	public int updateMemberPassword(MemberVO memberVO) {
		return sqlSessionTemplate.update("member.updateMemberPassword", memberVO);
	}

	@Override
	public List<String> getAllLicenseLocationList() {
		return sqlSessionTemplate.selectList("member.getAllLicenseLocationList");
	}

	@Override
	public void deleteCardByMemberId(String memberId) {
		sqlSessionTemplate.delete("member.deleteCardByMemberId", memberId);
	}

	@Override
	public void deleteLicenseByMemberId(String memberId) {
		sqlSessionTemplate.delete("member.deleteLicenseByMemberId", memberId);
	}

	@Override
	public MemberVO findLicenseInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.findLicenseInfoByMemberId", memberId);
	}

	@Override
	public List<MemberVO> findCardInfoByMemberId(String memberId) {
		return sqlSessionTemplate.selectList("member.findCardInfoByMemberId", memberId);
	}

	@Override
	public int countCardByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.countCardByMemberId", memberId);
	}

	@Override
	public int findPointByMemberId(String memberId) {
		return sqlSessionTemplate.selectOne("member.findPointByMemberId", memberId);
	}
	
}
