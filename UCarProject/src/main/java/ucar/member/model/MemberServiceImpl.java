package ucar.member.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.common.model.ReservationListVO;
import ucar.common.model.ReservationPagingBean;
import ucar.member.model.exception.DuplicateCardNumberException;
import ucar.member.model.exception.DuplicateLicenseNumberException;
import ucar.member.model.exception.DuplicateMemberIdException;
import ucar.member.model.exception.ExceedNumberOfCardException;
import ucar.member.model.exception.InvalidMemberIdException;
import ucar.sharing.reservation.model.ReservationVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return memberDAO.loginMember(mvo);
	}

	@Override
	public void registerMemberSavingPoint(MemberVO mvo) {
		memberDAO.registerMember(mvo);
	}

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

	@Override
	public List<String> getAllLicenseLocationList() {
		return memberDAO.getAllLicenseLocationList();
	}
	@Transactional
	@Override
	public int deleteMember(MemberVO memberVO) {
		memberDAO.deleteCardByMemberId(memberVO.getMemberId());
		memberDAO.deleteLicenseByMemberId(memberVO.getMemberId());		
		return memberDAO.deleteMember(memberVO.getMemberId());
	}
	@Override
	public void registerLicense(MemberVO memberVO) throws Exception {
		if(memberDAO.findLicenseInfoByLicenseNo(memberVO.getDrivingLicenseVO().getLicenseNo())!=null)
			throw new DuplicateLicenseNumberException("중복되는 면허번호 존재");
		memberDAO.registerLicense(memberVO);
	}

	@Override
	public void registerCard(MemberVO memberVO) throws Exception {
		if(memberDAO.findCardInfoByCardNo(memberVO.getCardVO().getCardNo())!=null)
			throw new DuplicateCardNumberException("중복되는 결제카드 존재");
		memberDAO.registerCard(memberVO);		
	}
	@Transactional
	@Override
	public MemberVO updateMember(MemberVO memberVO) {
		memberDAO.updateMemberInfo(memberVO);
		return memberDAO.findMemberInfoByMemberId(memberVO.getMemberId());
	}
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

	@Override
	public MemberVO findLicenseInfoByMemberId(String memberId) {
		return memberDAO.findLicenseInfoByMemberId(memberId);
	}

	@Override
	public List<MemberVO> findCardInfoByMemberId(String memberId) {
		return memberDAO.findCardInfoByMemberId(memberId);
	}

	@Override
	public String countCardByMemberId(String memberId) throws Exception {
		if(memberDAO.countCardByMemberId(memberId)>2){
			throw new ExceedNumberOfCardException("최대 등록할 수 있는 카드는 3개입니다.");
		}
		return "ok";
	}

	@Override
	public HashMap<String, Object> findPointAndCouponByMemberId(String memberId) {
		int point=memberDAO.findPointByMemberId(memberId);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("memberPoint", point);
		// memberId 의 쿠폰리스트
		return map;
	}
	
	@Override
	public ReservationListVO getReservationListByMemberId(String memberId, String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		ReservationVO reservationVO=new ReservationVO();
		MemberVO memberVO=new MemberVO();
		memberVO.setMemberId(memberId);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setHistoryPageNo(pageNo);
		List<ReservationVO> list=memberDAO.getReservationListByMemberId(reservationVO);
		int total=memberDAO.totalReservationByMemberId(memberId);
		ReservationPagingBean paging=new ReservationPagingBean(total,Integer.parseInt(pageNo));
		ReservationListVO listVO=new ReservationListVO(list,paging);
		return listVO;
	}

	@Override
	public ReservationListVO getUsedListByMemberId(String memberId,	String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		ReservationVO reservationVO=new ReservationVO();
		MemberVO memberVO=new MemberVO();
		memberVO.setMemberId(memberId);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setHistoryPageNo(pageNo);
		List<ReservationVO> list=memberDAO.getUsedListByMemberId(reservationVO);
		int total=memberDAO.totalUsedByMemberId(memberId);
		ReservationPagingBean paging=new ReservationPagingBean(total,Integer.parseInt(pageNo));
		ReservationListVO listVO=new ReservationListVO(list,paging);
		return listVO;
	}

	@Override
	public MemberVO findMemberInfoByMemberId(String memberId) {
		return memberDAO.findMemberInfoByMemberId(memberId);
	}
}
