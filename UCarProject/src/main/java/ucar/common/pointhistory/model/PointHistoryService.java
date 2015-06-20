package ucar.common.pointhistory.model;

import ucar.sharing.payment.model.PaymentVO;

public interface PointHistoryService {

	public void payingByPoint(PaymentVO paymentVO, String memberId);

	public void savingPoint(PointHistoryVO pointHistoryVO);

	public void returnPoint(PaymentVO paymentVO, String memberId);

}
