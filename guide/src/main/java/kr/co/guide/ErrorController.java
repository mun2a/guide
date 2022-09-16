package kr.co.guide;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	
	@RequestMapping(value = "/error403")
	public String error403(HttpServletRequest request, Model model) {
		
		return "error/dninePage";
	}	
	
	@RequestMapping(value = "/error404")
	public String error404(HttpServletRequest request, Model model) {
		
		return "error/error404";
	}	
	
	@RequestMapping(value = "/error500")
	public String error500(HttpServletRequest request, Model model) {

		return "error/error500";
	}	
	
//	@RequestMapping(value = "/error")
//	public String error(HttpServletRequest request, Model model) {
//		
//		model.addAttribute("msg", "Internal Server Error");
//		model.addAttribute("txt", "서버에 오류가 발생하였습니다.");
//		return "error/error";
//	}	
	
}
