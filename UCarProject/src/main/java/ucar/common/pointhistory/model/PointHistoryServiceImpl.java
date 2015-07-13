package ucar.common.pointhistory.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.sharing.payment.model.PaymentVO;

@Service
public class PointHistoryServiceImpl implements PointHistoryService {
	@Resource
	private PointHistoryDAO pointHistoryDAO;
	
	/**
	 * 포인트를 이용해 결제할 때 사용한 포인트만큼 회원의 보유포인트에서 차감한다.
	 * 포인트 내역에 사용한 포인트 양을 기록한다.
	 */
	@Transactional
	@Override
	public void payingByPoint(PaymentVO paymentVO, String memberId) {
		PointHistoryVO pointHistoryVO=new PointHistoryVO();
		pointHistoryVO.setMemberId(memberId);
		pointHistoryVO.setPointValue(paymentVO.getUsingPoint());
		pointHistoryVO.setPointContent(paymentVO.getPaymentType());
		pointHistoryVO.setPointType("차감");
		pointHistoryDAO.insertPointHistory(pointHistoryVO);
		pointHistoryDAO.memberPointSubtraction(pointHistoryVO);
	}
	
	/**
	 * 이용 서비스에 따른 포인트를 지급하고 포인트 내역에 적립된 포인트 양을 기록한다.
	 */
	@Override
	public void savingPoint(PointHistoryVO pointHistoryVO) {
		pointHistoryDAO.insertPointHistory(pointHistoryVO);
		pointHistoryDAO.memberPointAddition(pointHistoryVO);
	}
	
	/**
	 * 결제에 사용한 포인트를 환불하고 포인트 내역에 환불된 내역을 기록한다.
	 */
	@Override
	public void returnPoint(PaymentVO paymentVO, String memberId) {
		PointHistoryVO pointHistoryVO=new PointHistoryVO();
		pointHistoryVO.setMemberId(memberId);
		pointHistoryVO.setPointValue(paymentVO.getUsingPoint());
		pointHistoryVO.setPointContent("결제에 사용한 포인트 환불");
		pointHistoryVO.setPointType("적립");
		pointHistoryDAO.insertPointHistory(pointHistoryVO);
		pointHistoryDAO.memberPointAddition(pointHistoryVO);
	}
}
