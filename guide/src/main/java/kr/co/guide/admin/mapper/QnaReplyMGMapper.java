package kr.co.guide.admin.mapper;

import java.util.List;

import kr.co.guide.admin.domain.QnaReplyDTO;

public interface QnaReplyMGMapper {
	
	//답글 상세
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception;
	
	//qna 댓글 등록
	public int insertQnaReply(QnaReplyDTO qrDto);
	
	//qna 댓글 수정
	public int updateQnaReply(QnaReplyDTO qrDto);
	
	//qna 댓글 삭제
	public int deleteQnaReply(String qna_reply_no);
	
	//댓글 수
	public int countQnaReply(String qna_no);
	
	
	
	
	
	
}
