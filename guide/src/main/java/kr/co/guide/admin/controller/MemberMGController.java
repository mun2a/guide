package kr.co.guide.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.guide.admin.domain.MemberCriteria;
import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.domain.MemberPageDTO;
import kr.co.guide.admin.service.IMemberMGService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/memberMG")
public class MemberMGController {
	
	@Autowired
	private IMemberMGService service;

	/* ● 회원 목록 페이지 */
	//회원목록
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public void memberPage(MemberCriteria cri, Model model) throws Exception {
		log.info("memberPage..............");	
		
		model.addAttribute("memberMGList", service.getListWithdrawNPaging(cri));
		
		int total = service.getWithdrawNCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new MemberPageDTO(cri, total));
		
	}
	
	
	
//	@RequestMapping(value = "/memberList", method = RequestMethod.POST)
//	public void memberPagePost(MemberCriteria cri, Model model) throws Exception {
//		log.info("memberPage.....Post.........");	
//		
//		model.addAttribute("memberMGList", service.listPaging(cri));
//		
//		int total = service.getTotalCnt(cri);
//		log.info("total : " + total);
//		
//		model.addAttribute("pageMaker", new MemberPageDTO(cri, total));
//		
//	}
	
	//회원탈퇴
	@RequestMapping(value = "/memberWD", method = RequestMethod.POST)		
	public String memberWD(@RequestParam("member_id") String member_id) throws Exception {
		log.info("memberWD............................ : " + member_id);
		service.modifyWithdraw(member_id);
		return "redirect:/admin/memberMG/memberList";
	}
	
	/* ● 회원정보 상세 페이지 */
	@RequestMapping(value = "/memberDetail")
	public String memberDetail(@RequestParam("member_id") String member_id, Model model) throws Exception {
		log.info("memberDetail.............." + service.read(member_id));	
		
		model.addAttribute("memberDetail", service.read(member_id));
		
		return "admin/memberMG/memberDetail";
	}
	
	/* ● 회원정보 수정 페이지 */
	@RequestMapping(value = "/memberModify")
	public String memberModify(@RequestParam("member_id") String member_id, Model model) throws Exception {
		log.info("memberModify.............." + service.read(member_id));	
		
		model.addAttribute("memberModify", service.read(member_id));
		
		return "admin/memberMG/memberModify";
	}
	
	//중복 체크 기능 confirmNick
	@PostMapping(value = "/confirmNick", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> confirmNick(@RequestBody String member_nickname) throws Exception {
		log.info("userid............................................ : " + member_nickname);

		return service.confirmNick(member_nickname) == 0 ? new ResponseEntity<String>("0", HttpStatus.OK)
				: new ResponseEntity<String>("1", HttpStatus.OK);
	}
	
	//수정 기능 실행
	@RequestMapping(value = "/memberModifyPost", method = RequestMethod.POST)
	public String memberModifyPost(MemberDTO mDto) throws Exception {
		log.info("memberModifyPost.............." + service.modify(mDto));	
		
		
		return "admin/memberMG/memberModify";
	}

	
	/* ● 탈퇴한 회원 관리 페이지 */
	//탈퇴 회원목록
	@RequestMapping(value = "/memberWDList", method = RequestMethod.GET)
	public void memberWD(MemberCriteria cri, Model model) throws Exception {
		log.info("memberWDList..............");	
		
		model.addAttribute("memberMGList", service.listWithdrawPaging(cri));
		
		int total = service.getWithdrawCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new MemberPageDTO(cri, total));
		
	}
//	@RequestMapping(value = "/memberWDList", method = RequestMethod.POST)
//	public void memberWDPost(MemberCriteria cri, Model model) throws Exception {
//		log.info("memberWDList.......Post.......");	
//		
//		model.addAttribute("memberMGList", service.listWithdrawPaging(cri));
//		
//		int total = service.getWithdrawCnt(cri);
//		log.info("total : " + total);
//		
//		model.addAttribute("pageMaker", new MemberPageDTO(cri, total));
//		
//	}
	
	//회원 탈퇴 취소
	@RequestMapping(value = "/memberWDCancle", method = RequestMethod.POST)		
	public String memberWDCancle(@RequestParam("member_id") String member_id) throws Exception {
		log.info("memberWDCancle............................ : " + member_id);
		service.modifyWithdrawCancle(member_id);
		return "redirect:/admin/memberMG/memberWDList";
	}
	
	//회원 삭제
	@RequestMapping(value = "/memberRemove", method = RequestMethod.POST)
	public String memberRemove(@RequestParam("member_id") String member_id) throws Exception {
		log.info("memberRemove............................ : " + member_id);
		service.remove(member_id);
		return "redirect:/admin/memberMG/memberWDList";
	}
	
	
}
