package kr.co.guide.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.guide.admin.domain.Criteria;
import kr.co.guide.admin.domain.PageDTO;
import kr.co.guide.admin.service.IQnaMGService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/qnaMG")
public class QnaMGController {
	
	@Autowired
	private IQnaMGService service;
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public void qnaListAll(Criteria cri, Model model) throws Exception {
		log.info("show all QNA list ...........................................");
		
		model.addAttribute("qnaMGList", service.list(cri));
		
		int total = service.totalCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.POST)
	public void qnaListAllPost(Criteria cri, Model model) throws Exception {
		log.info("show all QNA list Post ...........................................");
		
		model.addAttribute("qnaMGList", service.list(cri));
		
		int total = service.totalCnt(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@RequestMapping(value = "/qnaDetail", method = RequestMethod.POST)		
	public void qnaDetail(@RequestParam("qna_no") String qna_no, Model model) throws Exception {
		log.info("qnaDetail............................ : " + qna_no);
		
		model.addAttribute("qnaDetail", service.read(qna_no));
		model.addAttribute("qnaReplyList", service.readReply(qna_no));
		
	}

}
