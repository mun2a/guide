package kr.co.guide.admin.service;

import java.util.List;

import kr.co.guide.admin.domain.QnaCriteria;
import kr.co.guide.admin.domain.QnaDTO;

public interface IQnaMGService {
	
	//문의글 목록
	public List<QnaDTO> list(QnaCriteria cri) throws Exception;
	public int totalCnt(QnaCriteria cri) throws Exception;
	
	//문의글 상세
	public QnaDTO read(String qna_no) throws Exception;
	
	//문의글 삭제
	public boolean removeQna(String qna_no) throws Exception;

}
