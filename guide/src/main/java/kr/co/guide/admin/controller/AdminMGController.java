package kr.co.guide.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.guide.admin.service.IAdminMGService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/adminMG")
public class AdminMGController {
	
	@Autowired
	private IAdminMGService service;
	
	/* ● 관리자 목록 페이지 */
	@RequestMapping(value = "/adminList")
	public String List(Model model) throws Exception {
		log.info("List..............");	
		
		model.addAttribute("adminMGList", service.list());
		
		return "admin/adminMG/adminList";
	}
	
	//관리자 권한 추가
	@RequestMapping(value = "/addAdminAuth", method = RequestMethod.POST)
	public String addAdminAuth(String member_id) throws Exception {
		
		service.addAdminAuth(member_id);
		
		return "redirect:/admin/adminMG/adminList";
	}
	
	
	//관리자 권한 삭제
		@RequestMapping(value = "/removeAdminAuth", method = RequestMethod.POST)
		public String removeAdminAuth(String member_id) throws Exception {
			
			service.removeAdminAuth(member_id);
			
			return "redirect:/admin/adminMG/adminList";
		}
	
	
	
	
}
