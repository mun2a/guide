package kr.co.guide.admin.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.service.IMemberMGService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/admin/memberMG")
@Log4j
public class RestMemberMGController {
	
	@Autowired
	private IMemberMGService service;
	
	
	//중복 체크 기능
	@PostMapping(value="/confirmNick")
	public String confirmNick(@RequestBody MemberDTO mDto) throws Exception {
		
		log.info("==================== restControlle confirmNick Post ====================");
		log.info("========member_nickname===============================" + mDto);
		
		String result = service.confirmNick(mDto);
		log.info("========result===============================" + result);
		
		return result;
	}
	
	
}
