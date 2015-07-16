package ucar.member.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.common.model.PagingBean;
import ucar.common.model.PointListVO;
import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.exception.DuplicateCardNumberException;
import ucar.member.model.exception.DuplicateLicenseNumberException;
import ucar.member.model.exception.DuplicateMemberIdException;
import ucar.member.model.exception.ExceedNumberOfCardException;
import ucar.member.model.exception.InvalidMemberIdException;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	
	/**
	 * 입력한 아이디와 비밀번호가 일치하는 회원정보를 조회해서 회원정보를 반환한다.
	 */
	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return memberDAO.loginMember(mvo);
	}
	
	/**
	 * 입력한 정보를 member table 에 삽입하고 point table 에도 회원가입으로 인해 발생한 포인트 내역을 삽입한다.
	 */
	@Transactional
	@Override
	public void registerMemberSavingPoint(MemberVO mvo) {
		memberDAO.registerMember(mvo);
	}
	
	/**
	 * 아이디체크
	 * 회원가입 시 입력한 아이디의 중복여부와 길이를 체크한다.
	 * 아이디의 길이가 적합하지 않을 경우 InvalidMemberIdException 을 발생하고, 아이디가 중복될 경우 DuplicateMemberIdException 을 발생한다.
	 */
	@Override
	public String memberIdCheck(String memberId) throws Exception {
		String result="fail";
		if(memberId.length()<4 || memberId.length()>10){
			throw new InvalidMemberIdException("4자이상 10자이하로 아이디는 제한됩니다.");
		} else{
			result=memberDAO.memberIdCheck(memberId);
			if(result.equals("fail")){
				throw new DuplicateMemberIdException("중복되는 아이디 존재");
			}
		}
		return result;
	}
	
	/**
	 * 운전면허정보 등록할 때 선택할 수 있는 지역목록을 반환한다.
	 */
	@Override
	public List<String> getAllLicenseLocationList() {
		return memberDAO.getAllLicenseLocationList();
	}
	
	/**
	 * 회원탈퇴
	 * 탈퇴할 회원의 비밀번호가 일치하면 member table 에서 회원정보를 삭제한다.
	 * 탈퇴할 회원의 비밀번호가 일치하지않으면 0을 반환한다.
	 */
	@Transactional
	@Override
	public int deleteMember(MemberVO memberVO) {
		if(memberDAO.memberPasswordCheck(memberVO)!="ok"){
			return 0;
		}
		return memberDAO.deleteMember(memberVO.getMemberId());
	}
	
	/**
	 * memberVO 의 licenceNo 를 조회해서 중복되면 DuplicateLicenseNumberException 발생시키고
	 * 중복되지 않으면 면허정보를 등록한다.
	 */
	@Override
	public void registerLicense(MemberVO memberVO) throws Exception {
		if(memberDAO.findLicenseInfoByLicenseNo(memberVO.getDrivingLicenseVO().getLicenseNo())!=null)
			throw new DuplicateLicenseNumberException("중복되는 면허번호 존재");
		memberDAO.registerLicense(memberVO);
	}
	
	/**
	 * memberVO 의 cardNo 를 조회해서 중복되면 DuplicateCardNumberException 발생시키고
	 * 중복되지 않으면 결제카드정보를 등록한다.
	 */
	@Override
	public void registerCard(MemberVO memberVO) throws Exception {
		if(memberDAO.findCardInfoByCardNo(memberVO.getCardVO().getCardNo())!=null)
			throw new DuplicateCardNumberException("중복되는 결제카드 존재");
		memberDAO.registerCard(memberVO);		
	}
	
	/**
	 * 입력받은 정보로 회원정보를 수정한다.
	 */
	@Transactional
	@Override
	public MemberVO updateMember(MemberVO memberVO) {
		memberDAO.updateMemberInfo(memberVO);
		return memberDAO.findMemberInfoByMemberId(memberVO.getMemberId());
	}
	
	/**
	 * 기존 비밀번호가 일치하는지 확인하고, 일치하면 새로운 비밀번호로 변경한다.
	 * 일치하지 않으면 flag 에 fail 을 세팅한다.
	 */
	@Transactional
	@Override
	public HashMap<String,Object> updateMemberPassword(String oriMemberPassword, MemberVO memberVO) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		String newPass=memberVO.getMemberPassword();
		memberVO.setMemberPassword(oriMemberPassword);
		map.put("flag", "fail");
		if(memberDAO.memberPasswordCheck(memberVO)!="ok")
			map.put("message", "기존 비밀번호가 일치하지 않습니다!" );
		else{
			memberVO.setMemberPassword(newPass);
			memberDAO.updateMemberPassword(memberVO);
			map.put("flag", "ok");
			map.put("message", "비밀번호 수정 완료");
			map.put("memberVO", memberDAO.findMemberInfoByMemberId(memberVO.getMemberId()));
		}
		return map;
	}
	
	/**
	 * 회원의 면허정보를 조회한다.
	 */
	@Override
	public MemberVO findLicenseInfoByMemberId(String memberId) {
		return memberDAO.findLicenseInfoByMemberId(memberId);
	}
	
	/**
	 * 회원의 결제카드목록을 조회한다.
	 */
	@Override
	public List<MemberVO> findCardInfoByMemberId(String memberId) {
		return memberDAO.findCardInfoByMemberId(memberId);
	}
	
	/**
	 * 회원의 등록한 결제카드의 수를 조회한다. 
	 * 3개 이상이면 ExceedNumberOfCardException 을 발생하고 그렇지 않으면 ok 를 반환한다.
	 */
	@Override
	public String countCardByMemberId(String memberId) throws Exception {
		if(memberDAO.countCardByMemberId(memberId)>2){
			throw new ExceedNumberOfCardException("최대 등록할 수 있는 카드는 3개입니다.");
		}
		return "ok";
	}

	@Override
	public int findPointByMemberId(String memberId) {
		return memberDAO.findPointByMemberId(memberId);
	}		
	
	/**
	 * memberId 에 해당하는 정보를 조회한다.
	 */
	@Override
	public MemberVO findMemberInfoByMemberId(String memberId) {
		return memberDAO.findMemberInfoByMemberId(memberId);
	}
	
	/**
	 * 회원의 포인트 내역을 조회한다. 
	 */
	@Override
	public PointListVO getPointListByMemberId(PointHistoryVO pointHistoryVO) {
		if(pointHistoryVO.getPointPageNo()==null||pointHistoryVO.getPointPageNo().equals("")) 
			pointHistoryVO.setPointPageNo("1");
		List<PointHistoryVO> list=memberDAO.getPointListByMemberId(pointHistoryVO);
		int total=memberDAO.totalPointHistoryByMemberId(pointHistoryVO);
		PagingBean pagingBean=new PagingBean(total, Integer.parseInt(pointHistoryVO.getPointPageNo()));
		PointListVO listVO=new PointListVO(list, pagingBean);
		return listVO;
	}
	
	/**
	 * 회원의 아이디를 조회한다.
	 */
	@Override
	public MemberVO findMemberId(MemberVO memberVO){
		return memberDAO.findMemberId(memberVO);
	}
	
	/**
	 * 회원의 비밀번호를 조회한다.
	 */
	@Override
	public MemberVO findMemberPassword(MemberVO memberVO){
		return memberDAO.findMemberPassword(memberVO);
	}
	
	/**
	 * 카드번호로 결제 카드 삭제
	 */
	@Override
	public void deleteCardByCardNo(String cardNo) {
		memberDAO.deleteCard(cardNo);
	}
}
