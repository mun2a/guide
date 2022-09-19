package kr.co.guide;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

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
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex, Model model) {
		model.addAttribute("msg", "Page Not Found");
		model.addAttribute("txt", "요청한 페이지를 찾을 수 없습니다. ");
		return "error/error";
	}
	
	@RequestMapping(value = "/error500")
	public String error500(HttpServletRequest request, Model model) {

		return "error/error500";
	}	
	
}
