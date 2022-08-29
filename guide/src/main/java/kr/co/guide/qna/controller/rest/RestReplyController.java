package kr.co.guide.qna.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.guide.qna.domain.ReplyDTO;
import kr.co.guide.qna.service.IReplyService;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reply")
public class RestReplyController {
	
	@Autowired
	IReplyService replyService;
	
	@PostMapping("/add")
	public ReplyDTO replyAddPost(@RequestBody ReplyDTO rDto) {
		
		log.info("==================== restController replyAdd Post ====================");
		
		replyService.insertReplyBoard(rDto);
		System.out.println(rDto.getQna_reply_no());
		ReplyDTO replyInfo = replyService.selectReplyInfo(rDto.getQna_reply_no());
		System.out.println(replyInfo);
		return replyInfo;
	}
	
	@PostMapping("/delete")
	public boolean replyDeletePost(@RequestBody ReplyDTO rDto) {
		
		log.info("==================== restController replyDelete Post ====================");
		
		System.out.println(rDto);
		replyService.delectReplyBoard(rDto);
		return true;
	}
	
	
	@PostMapping("/list")
	public ReplyDTO replyListPost(@RequestBody ReplyDTO rDto) {
		
		log.info("==================== restController replyList Post ====================");
		
		System.out.println(rDto);
		ReplyDTO replyInfo = replyService.selectReplyInfo(rDto.getQna_reply_no());
		return replyInfo;
	}
	
	@PostMapping("/modify")
	public ReplyDTO replyModifyPost(@RequestBody ReplyDTO rDto) {
		
		log.info("==================== restController replyModify Post ====================");
		
		System.out.println(rDto);
		replyService.updateReplyBoard(rDto);
		ReplyDTO replyInfo = replyService.selectReplyInfo(rDto.getQna_reply_no());
		return replyInfo;
	}
	
}
