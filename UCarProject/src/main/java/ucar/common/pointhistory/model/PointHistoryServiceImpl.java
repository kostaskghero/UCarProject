package ucar.common.pointhistory.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.sharing.payment.model.PaymentVO;

@Service
public class PointHistoryServiceImpl implements PointHistoryService {
	@Resource
	private PointHistoryDAO pointHistoryDAO;

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

	@Override
	public void savingPoint(PointHistoryVO pointHistoryVO) {
		pointHistoryDAO.insertPointHistory(pointHistoryVO);
		pointHistoryDAO.memberPointAddition(pointHistoryVO);
	}

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
