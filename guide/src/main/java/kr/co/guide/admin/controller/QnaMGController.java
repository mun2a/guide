package kr.co.guide.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.guide.admin.domain.QnaCriteria;
import kr.co.guide.admin.domain.QnaPageDTO;
import kr.co.guide.admin.service.IQnaMGService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/qnaMG")
public class QnaMGController {
	
	@Autowired
	private IQnaMGService service;
	
	@RequestMapping(value = "/qnaList")
	public void qnaListAll(QnaCriteria cri, Model model) throws Exception {
		log.info("show all QNA list ...........................................");
		
		model.addAttribute("qnaMGList", service.list(cri));
		
		int total = service.totalCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new QnaPageDTO(cri, total));
	}
	
	
	@RequestMapping(value = "/qnaDetail")		
	public void qnaDetail(@RequestParam("qna_no") String qna_no, Model model) throws Exception {
		log.info("qnaDetail............................ : " + qna_no);
		
		model.addAttribute("qnaDetail", service.read(qna_no));
		model.addAttribute("qnaReplyList", service.readReply(qna_no));
		
	}

}
