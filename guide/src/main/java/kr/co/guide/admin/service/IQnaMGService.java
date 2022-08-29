package kr.co.guide.admin.service;

import java.util.List;

import kr.co.guide.admin.domain.Criteria;
import kr.co.guide.admin.domain.QnaDTO;
import kr.co.guide.admin.domain.QnaReplyDTO;

public interface IQnaMGService {
	
	//문의글 목록
	public List<QnaDTO> list(Criteria cri) throws Exception;
	public int totalCnt(Criteria cri) throws Exception;
	
	//문의글 상세
	public QnaDTO read(String qna_no) throws Exception;
	
	//문의글 답변
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception;

}
