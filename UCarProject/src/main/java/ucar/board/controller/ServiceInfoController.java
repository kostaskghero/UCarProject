package ucar.board.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceInfoController {
	@RequestMapping("service_home_usehow.do")
	public ModelAndView usehow(){
		System.out.println("서비스홈");
		return new ModelAndView("service_usehow_form");
	}
	@RequestMapping("service_home_userule.do")
	public ModelAndView userule(){
		System.out.println("서비스룰");
		
		return new ModelAndView("service_userule_form");
	}
	@RequestMapping("service_home_ucarguide.do")
	public ModelAndView ucarguide(){
		System.out.println("유카가이드");
		
		return new ModelAndView("service_ucarguide_form");
	}
	@RequestMapping("service_home_ucareffect.do")
	public ModelAndView serviceinfoQna(){
		System.out.println("유카이팩트");
		
		return new ModelAndView("service_ucareffect_form");
	}
}
