package ucar.common.pointhistory.controller;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import ucar.common.pointhistory.model.PointHistoryService;
import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.MemberVO;
import ucar.sharing.payment.model.PaymentVO;

@Component
@Aspect
public class PointHistoryAspect {
	@Resource
	private PointHistoryService pointHistoryService;
	@After("execution(public * ucar..*Service.*SavingPoint(..))")
	public void savingPoint(JoinPoint point){
		Object param[]=point.getArgs();
		PointHistoryVO pointHistoryVO=new PointHistoryVO();
		pointHistoryVO.setPointType("적립");
		String methodName=point.getSignature().getName();
		if(methodName.contains("payment")){	// 반납결제
			PaymentVO paymentVO=(PaymentVO) param[0];
			pointHistoryVO.setMemberId((String)param[1]);
			pointHistoryVO.setPointValue(paymentVO.getPaymentPrice()*0.1);
			pointHistoryVO.setPointContent("유카이용");
		} else if(methodName.contains("Member")){
			pointHistoryVO.setMemberId(((MemberVO)param[0]).getMemberId());
			pointHistoryVO.setPointValue(10000);
			pointHistoryVO.setPointContent("회원가입");
		}
		pointHistoryService.savingPoint(pointHistoryVO);
		System.out.println(("메서드 인자값 : "+param[0]));
		System.out.println("메서드명:"+point.getClass().getName());
	}
	
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
	// transaction 안됨
	/*@Around("execution(public * ucar..*Service.payment*(..)) || execution(public * ucar..*Service.*SavingPoint(..))")
	public Object savingPayingPoint(ProceedingJoinPoint point) throws Throwable{
		Object param[]=point.getArgs();
		if()
	}*/
}
