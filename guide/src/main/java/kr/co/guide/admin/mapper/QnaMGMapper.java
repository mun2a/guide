package kr.co.guide.admin.mapper;

import java.util.List;

import kr.co.guide.admin.domain.QnaCriteria;
import kr.co.guide.admin.domain.QnaDTO;

public interface QnaMGMapper {
	
	//문의글 목록
	public List<QnaDTO> getListWithPaging(QnaCriteria cri) throws Exception;
	public int getTotalCnt(QnaCriteria cri) throws Exception;
	
	//문의글 상세
	public QnaDTO read(String qna_no) throws Exception;
	
	//문의글 삭제
	public boolean deleteQna(String qna_no) throws Exception;
	
	//qna 댓글 존재 여부
	public int updateQnaExist(QnaDTO qDto);

}
