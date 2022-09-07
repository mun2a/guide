package kr.co.guide.admin.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.service.IAdminMGService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/admin/adminMG")
@Log4j
public class RestAdminMGController {
	
	@Autowired
	private IAdminMGService service;
	
	
	//관리자 권한 추가 - 이메일 확인
	
	@PostMapping(value="/confirmPK")
	public String confirmPK(@RequestBody MemberDTO mDto) throws Exception {
		
		log.info("==================== restControlle confirmPK Post ====================");
		
		String result = service.confirmPK(mDto);
		
		return result;
	}
	
	
}
