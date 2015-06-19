package ucar.common.pointhistory.controller;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import ucar.common.pointhistory.model.PointHistoryService;

@Component
@Aspect
public class PointHistoryAspect {
	@Resource
	private PointHistoryService pointHistoryService;
	@After("execution(public * ucar..*Service.*SavingPoint(..))")
	public void savingPoint(JoinPoint point){
		Object param[]=point.getArgs();
		System.out.println(("메서드 인자값 : "+param[0]));
		System.out.println("메서드명:"+point.getClass().getName());
		String methodName=point.getClass().getName();
	}
	
	@Before("execution(public * ucar.sharing..*Service.usingPoint*(..))")
	public void usingPoint(JoinPoint point){
		Object param[]=point.getArgs();
		System.out.println("메서드 인자값 : "+param[0]);
		System.out.println("메서드명:"+point.getClass().getName());
	}
}
