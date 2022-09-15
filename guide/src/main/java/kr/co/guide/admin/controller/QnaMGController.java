package kr.co.guide.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.guide.admin.domain.QnaCriteria;
import kr.co.guide.admin.domain.QnaPageDTO;
import kr.co.guide.admin.service.IQnaMGService;
import kr.co.guide.admin.service.IQnaReplyMGService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/qnaMG")
public class QnaMGController {
	
	@Autowired
	private IQnaMGService qnaService;
	@Autowired
	private IQnaReplyMGService qnaReplyService;
	
	@RequestMapping(value = "/qnaList")
	public void qnaListAll(QnaCriteria cri, Model model) throws Exception {
		log.info("show all QNA list ...........................................");
		int total = qnaService.totalCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("qnaMGList", qnaService.list(cri));
		model.addAttribute("pageMaker", new QnaPageDTO(cri, total));
	}
	
	
	@RequestMapping(value = "/qnaDetail")		
	public void qnaDetail(@RequestParam("qna_no") String qna_no, 
			@ModelAttribute("cri") QnaCriteria cri, Model model) throws Exception {
		log.info("qnaDetail............................ : " + qna_no);
		
		model.addAttribute("qnaDetail", qnaService.read(qna_no));
		model.addAttribute("qnaReplyList", qnaReplyService.readReply(qna_no));
		model.addAttribute("cri", cri);
		
	}
	
	//qna 글 삭제 기능
	@PostMapping("/delete")
	public String qnaDeletePost(String qna_no, 
			QnaCriteria cri, RedirectAttributes rttr) throws Exception {
		log.info("qnaDetail............................ : " + qna_no);
		
		int total = qnaService.totalCnt(cri);
		if (total%cri.getAmount() == 1) {
			cri.setPageNum(cri.getPageNum()-1);
			if (cri.getPageNum()<1) {
				cri.setPageNum(1);
			}
		} 
		qnaService.removeQna(qna_no);
		rttr.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
		
		return "redirect:/admin/qnaMG/qnaList" + cri.GetListLink();
	}

}
