package ucar.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FeeController {
	@RequestMapping("feeinfo_home_feeinfo.do")
	public ModelAndView usehow(){
		System.out.println("요금안내");
		
		return new ModelAndView("feeinfo_feeinfo_view");
	}

}
