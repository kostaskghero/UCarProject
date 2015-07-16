package ucar.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AspectLogging {
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@Before("execution(public * ucar..*Service.*(..))")
	public void beforLog(JoinPoint point){
		logger.debug("{} method", point.getClass().getName());
	}
}
