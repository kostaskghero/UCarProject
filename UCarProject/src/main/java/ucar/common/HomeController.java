package ucar.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
/*	@RequestMapping("member_register.do")
	public ModelAndView memberRegister(HttpServletRequest request, HttpServletResponse response){
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
	
		return new ModelAndView("member_register_result", "data", id+password+email+phone+birth);
	}*/
}















