package kr.co.guide.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")		//WAS /gogo.co.kr
public class AdminController {	//http://localhost:9090/gogo.co.kr/admin/adHome
	
	@RequestMapping(value = "/adHome")
	public String adHome() {
		log.info("adHome..............");	
		
		return "admin/adHome";
	}
	
	
}
