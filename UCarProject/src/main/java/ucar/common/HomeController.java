package ucar.common;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ucar.board.review.model.ReviewService;
import ucar.sharing.search.model.SearchService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Resource
	private SearchService searchService;
	@Resource
	private ReviewService reviewService;
	/**
	 * viewId 에 해당하는 definition name 을 가지는 TilseView 로 제공
	 * @param viewId
	 * @return
	 */
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId){
		logger.info(viewId);
		System.out.println(viewId);
		return viewId;
	}
	
	/**
	 * 메인화면을 제공할 때, 베스트 이용후기와 검색에 필요한 차량모델 목록을 제공한다.
	 * @return
	 */
	@RequestMapping("home.do")
	public ModelAndView homeView(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		mv.addObject("bestList",reviewService.getBestReview());
		mv.addObject("carModelList", searchService.getAllCarModelList());
		return mv;
	}
}















