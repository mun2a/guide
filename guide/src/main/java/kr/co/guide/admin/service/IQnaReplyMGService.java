package kr.co.guide.admin.service;

import java.util.List;

import kr.co.guide.admin.domain.QnaReplyDTO;

public interface IQnaReplyMGService {
	
	//문의글 답변 read
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception;
	
	//qna 댓글 등록
	public int addQnaReply(QnaReplyDTO qrDto);
	
	//qna 댓글 수정
	public int modifyQnaReply(QnaReplyDTO qrDto);
	
	//qna 댓글 삭제
	public int removeQnaReply(QnaReplyDTO qrDto);
	
	
	
	
	
	

}
