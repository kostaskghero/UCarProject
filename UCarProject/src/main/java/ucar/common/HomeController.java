package ucar.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId){
		logger.info(viewId);
		System.out.println(viewId);
		return viewId;
	}
	@RequestMapping("register.do")
	public ModelAndView memberRegister(HttpServletRequest request, HttpServletResponse response){
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
	
		return new ModelAndView("register_result", "data", id+password+email+phone+birth);
	}
}















