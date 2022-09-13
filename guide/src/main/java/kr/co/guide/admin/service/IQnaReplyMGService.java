package kr.co.guide.admin.service;

import java.util.List;

import kr.co.guide.admin.domain.QnaReplyDTO;

public interface IQnaReplyMGService {
	
	//문의글 답변 read
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception;

}
