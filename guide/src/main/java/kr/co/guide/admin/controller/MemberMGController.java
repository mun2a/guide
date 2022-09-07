package kr.co.guide.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void memberPageGet(MemberCriteria cri, Model model) throws Exception {
		log.info("memberPage.............get.");	
		
		model.addAttribute("memberMGList", service.getListWithdrawNPaging(cri));
		
		int total = service.getWithdrawNCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new MemberPageDTO(cri, total));
		model.addAttribute("cri", cri);
		
	}
	
	
	//회원탈퇴
	@RequestMapping(value = "/memberWD", method = RequestMethod.GET)		
	public String memberWDCri(@RequestParam("member_id") String member_id, MemberCriteria cri) throws Exception {
		log.info("memberWD............................ : " + member_id);
		
		//회원 해당 페이지에 1명 있을 경우 이전 페이지 이동
		int total = service.getWithdrawNCnt(cri);
		if (total%cri.getAmount() == 1) {
			cri.setPageNum(cri.getPageNum()-1);
			if (cri.getPageNum()<1) {
				cri.setPageNum(1);
			}
		} 
		service.modifyWithdraw(member_id);
		return "redirect:/admin/memberMG/memberList" + cri.GetListLink() ;
	}
	
	
	/* ● 회원정보 상세 페이지 */
	@RequestMapping(value = "/memberDetail")
	public String memberDetail(@RequestParam("member_id") String member_id, 
				@ModelAttribute("cri") MemberCriteria cri, Model model) throws Exception {
		log.info("memberDetail.............." + service.read(member_id));	
		
		model.addAttribute("memberDetail", service.read(member_id));
		model.addAttribute("cri", cri);
		
		return "admin/memberMG/memberDetail";
	}
	
	/* ● 회원정보 수정 페이지 */
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public String memberModify(@RequestParam("member_id") String member_id, 
				@ModelAttribute("cri") MemberCriteria cri, 
				Model model) throws Exception {
		log.info("memberModify.............." + service.read(member_id));	
		
		model.addAttribute("memberModify", service.read(member_id));
		model.addAttribute("cri", cri);
		
		return "admin/memberMG/memberModify";
	}
	
	
	//수정 기능 실행
	@RequestMapping(value = "/memberModifyPost", method = RequestMethod.POST)
	public String memberModifyPost(MemberDTO mDto,
			@ModelAttribute("cri") MemberCriteria cri,
			RedirectAttributes rttr)throws Exception {
		log.info("memberModifyPost.............." + service.modify(mDto));	
		
		return "redirect:/admin/memberMG/memberDetail" + cri.GetListLink();
	}

	
	/* ● 탈퇴한 회원 관리 페이지 */
	//탈퇴 회원목록
	@RequestMapping(value = "/memberWDList")
	public void memberWDPage(MemberCriteria cri, Model model) throws Exception {
		log.info("memberWDList..............");		
		
		model.addAttribute("memberMGList", service.listWithdrawPaging(cri));
		
		int total = service.getWithdrawCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new MemberPageDTO(cri, total));
		
	}
	
	//회원 탈퇴 취소
	@RequestMapping(value = "/memberWDCancle", method = RequestMethod.POST)		
	public String memberWDCancle(@RequestParam("member_id") String member_id, MemberCriteria cri) throws Exception {
		log.info("memberWDCancle............................ : " + member_id);
		
		//탈퇴한 회원인 한페이지에 1명 있을 경우 이전 페이지 이동
		int total = service.getWithdrawCnt(cri);
		if (total%cri.getAmount() == 1) {
			cri.setPageNum(cri.getPageNum()-1);
			if (cri.getPageNum()<1) {
				cri.setPageNum(1);
			}
		} 
		service.modifyWithdrawCancle(member_id);
		
		return "redirect:/admin/memberMG/memberWDList" + cri.GetListLink() ;
		
	}
	
	
	//회원 삭제
	@RequestMapping(value = "/memberRemove", method = RequestMethod.POST)
	public String memberRemove(@RequestParam("member_id") String member_id, MemberCriteria cri) throws Exception {
		log.info("memberRemove............................ : " + member_id);
		
		//삭제한 회원인 한페이지에 1명 있을 경우 이전 페이지 이동
		int total = service.getWithdrawCnt(cri);
		if (total%cri.getAmount() == 1) {
			cri.setPageNum(cri.getPageNum()-1);
			if (cri.getPageNum()<1) {
				cri.setPageNum(1);
			}
		} 
		service.remove(member_id);
		return "redirect:/admin/memberMG/memberWDList" + cri.GetListLink() ;
	}
	
	
}
