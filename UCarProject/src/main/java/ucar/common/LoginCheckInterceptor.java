package ucar.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
@Controller
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	/**
	 * Handler Interceptor
	 * DispatcherServlet이 해당 컨트롤러를 호출하기 전,후에 요청과 응답을 제어하는 역할
	 * 세션 유무 판단과 세션이 존재하면 인증 정보의 존재 유무를 판단하여
	 * 비인증 상태이면 redirect return false;
	 * true 반환하면 컨트롤러 수행
	 * servlet-context.xml 에 설정하고 auth_*.do 의 url 은 모두 session 유무 판단
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null || session.getAttribute("loginInfo")==null){
			response.sendRedirect("member_login_form.do");
			return false;
		}
		return true;
	}
}
