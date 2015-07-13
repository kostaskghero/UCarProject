package ucar.common.pointhistory.controller;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import ucar.board.review.model.ReviewVO;
import ucar.board.reviewcomment.model.ReviewCommentVO;
import ucar.common.pointhistory.model.PointHistoryService;
import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.MemberVO;
import ucar.sharing.payment.model.PaymentVO;

@Component
@Aspect
public class PointHistoryAspect {
	@Resource
	private PointHistoryService pointHistoryService;
	/**
	 * 포인트 적립
	 * 회원에게 서비스 이용에 대한 포인트를 지급한다.
	 * 포인트 지급은 공통 사항으로 처리한다.
	 * 모든 서비스 계층에 있는 method 중 SavingPoint 로 끝나는 method 가 실행된 후
	 * 포인트 적립되는 savingPoint() 가 수행된다.
	 * @param point
	 */
	@After("execution(public * ucar..*Service.*SavingPoint(..))")
	public void savingPoint(JoinPoint point){
		Object param[]=point.getArgs();
		PointHistoryVO pointHistoryVO=new PointHistoryVO();
		pointHistoryVO.setPointType("적립");
		String methodName=point.getSignature().getName();
		if(methodName.contains("payment")){
			PaymentVO paymentVO=(PaymentVO) param[0];
			pointHistoryVO.setMemberId((String)param[1]);
			pointHistoryVO.setPointValue(paymentVO.getPaymentPrice()*0.1);
			pointHistoryVO.setPointContent("유카이용");
		} else if(methodName.contains("Member")){
			pointHistoryVO.setMemberId(((MemberVO)param[0]).getMemberId());
			pointHistoryVO.setPointValue(10000);
			pointHistoryVO.setPointContent("회원가입");
		} else if(methodName.contains("Review")){
			pointHistoryVO.setMemberId(((ReviewVO)param[0]).getMemberId());
			pointHistoryVO.setPointValue(2000);
			pointHistoryVO.setPointContent("후기작성");
		}
		if(!pointHistoryVO.getMemberId().equals("admin")){
			pointHistoryService.savingPoint(pointHistoryVO);
		}
	}
	
	/**
	 * 포인트 차감 & 환불
	 * 서비스 결제 시 포인트를 사용하면 보유 포인트를 차감하고
	 * 포인트 사용한 결제에 대한 취소가 이루어질 때 환불해준다.
	 * 모든 결제가 이루어 질 때 공통 사항으로 처리한다.
	 * 모든 서비스 계층에 있는 method 중 payment 로 시작하는 method 가 실행되기 전
	 * 포인트 차감 or 환불에 대한 payingByPoint() 가 수행된다.
	 * @param point
	 */
	@Before("execution(public * ucar..*Service.payment*(..))")
	public void payingByPoint(JoinPoint point){
		Object param[]=point.getArgs();
		PaymentVO paymentVO=(PaymentVO) param[0];
		String memberId=(String)param[1];
		String methodName=point.getSignature().getName();
		if(methodName.contains("Cancel")){
			pointHistoryService.returnPoint(paymentVO, memberId);
		} else if(paymentVO.getUsingPoint()>0){
			pointHistoryService.payingByPoint(paymentVO, memberId);
		}
	}
}
