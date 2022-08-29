package kr.co.guide.admin.mapper;

import java.util.List;

import kr.co.guide.admin.domain.Criteria;
import kr.co.guide.admin.domain.QnaDTO;
import kr.co.guide.admin.domain.QnaReplyDTO;

public interface QnaMGMapper {
	
	//문의글 목록
	public List<QnaDTO> getListWithPaging(Criteria cri) throws Exception;
	public int getTotalCnt(Criteria cri) throws Exception;
	
	//문의글 상세
	public QnaDTO read(String qna_no) throws Exception;
	
	//답글 상세
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception;

}
