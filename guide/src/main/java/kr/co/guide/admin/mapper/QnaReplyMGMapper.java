package kr.co.guide.admin.mapper;

import java.util.List;

import kr.co.guide.admin.domain.QnaReplyDTO;

public interface QnaReplyMGMapper {
	
	//답글 상세
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception;

}
