package kr.co.guide.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.guide.admin.domain.MemberCriteria;
import kr.co.guide.admin.domain.QnaCriteria;
import kr.co.guide.admin.domain.QnaPageDTO;
import kr.co.guide.admin.domain.QnaReplyDTO;
import kr.co.guide.admin.service.IQnaMGService;
import kr.co.guide.admin.service.IQnaReplyMGService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/qnaReplyMG")
public class QnaReplyMGController {
	
	@Autowired
	private IQnaMGService qnaService;
	@Autowired
	private IQnaReplyMGService qnaReplyService;
	
//	@RequestMapping(value = "/qnaList")
//	public void qnaListAll(QnaCriteria cri, Model model) throws Exception {
//		log.info("show all QNA list ...........................................");
//		int total = qnaService.totalCnt(cri);
//		log.info("total : " + total);
//		
//		model.addAttribute("qnaMGList", qnaService.list(cri));
//		model.addAttribute("pageMaker", new QnaPageDTO(cri, total));
//	}
	
	//관리자 댓글 등록
	@PostMapping(value = "/addReply")
	public String addReplyPost(QnaReplyDTO qrDto, @ModelAttribute("cri") MemberCriteria cri,
			RedirectAttributes rttr) {
		log.info("addReplyPost...........................................qrDto:" + qrDto);
		
		qnaReplyService.addQnaReply(qrDto);
		rttr.addAttribute("qna_no", qrDto.getQna_no());
		
		return "redirect:/admin/qnaMG/qnaDetail" + cri.GetListLink() ;
	}
	
	//관리자 댓글 수정
	@PostMapping(value = "/modifyReply")
	public String modifyReplyPost(QnaReplyDTO qrDto, @ModelAttribute("cri") MemberCriteria cri,
			RedirectAttributes rttr) {
		log.info("modifyReplyPost...........................................qrDto:" + qrDto);
		
		qnaReplyService.modifyQnaReply(qrDto);
		rttr.addAttribute("qna_no", qrDto.getQna_no());
		
		return "redirect:/admin/qnaMG/qnaDetail" + cri.GetListLink() ;
	}
	
	//관리자 댓글 삭제
	@PostMapping(value = "/removeReply")
	public String removeReplyPost(QnaReplyDTO qrDto, @ModelAttribute("cri") MemberCriteria cri,
			RedirectAttributes rttr) throws Exception {
		log.info("removeReplyPost...........................................qrDto:" + qrDto);
		
		qnaReplyService.removeQnaReply(qrDto);
		rttr.addAttribute("qna_no", qrDto.getQna_no());
		
		return "redirect:/admin/qnaMG/qnaDetail" + cri.GetListLink() ;
	}
	
	

}
