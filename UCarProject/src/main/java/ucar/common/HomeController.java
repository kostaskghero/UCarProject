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
	/**
	 * 아래의 url 로 접근할 때 viewId 에 해당하는 definition name 을 가지는 TilseView 로 제공
	 * home.do
	 * member_login_form.do
	 * member_register_result.do
	 * auth_member_registerLicenseAndCard_form.do
	 * auth_member_registerCard_form.do
	 * auth_member_updateMemberPassword_form
	 * auth_member_delete_form.do
	 * auth_member_myPage.do
	 * @param viewId
	 * @return
	 */
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId){
		logger.info(viewId);
		System.out.println(viewId);
		return viewId;
	}
}















