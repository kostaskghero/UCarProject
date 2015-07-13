package ucar.board.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceInfoController {
	/**
	 * 서비스 안내 탭을 누르면 기본으로 이용방법페이지로 이동한다.
	 * @returnt
	 */
	@RequestMapping("service_home_usehow.do")
	public ModelAndView usehow(){
		return new ModelAndView("service_usehow_form");
	}
	/**
	 * 이용방법 메뉴를 클릭했을때 이동하는 페이지
	 * @return
	 */
	@RequestMapping("service_home_userule.do")
	public ModelAndView userule(){		
		return new ModelAndView("service_userule_form");
	}
	/**
	 * 이용규칙 메뉴를 클릭했을때 이동하는 페이지
	 * @return
	 */
	@RequestMapping("service_home_ucarguide.do")
	public ModelAndView ucarguide(){
		return new ModelAndView("service_ucarguide_form");
	}
	/**
	 * 유카 이펙트 메뉴를 클릭했을때 이동하는 페이지
	 * @return
	 */
	@RequestMapping("service_home_ucareffect.do")
	public ModelAndView serviceinfoQna(){
		return new ModelAndView("service_ucareffect_form");
	}
}
