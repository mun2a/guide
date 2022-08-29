package kr.co.guide.qna.service;

import java.util.List;
import java.util.Map;

import kr.co.guide.qna.domain.QnaDTO;

public interface IQnaService {
	
	public boolean insertQnaBoard(QnaDTO qDto);             		 // qna 게시글 등록 기능
	
	public List<QnaDTO> selectQnaList(Map<String, Object> map);      // qna 모든 글 가져오기
	
	public QnaDTO selectQnaInfo(String qna_no);          			 // qna 상세글
			
	public boolean updateQnaBoard(QnaDTO qDto);              		 // qan 게시글 수정

	public boolean delectQnaBoard(String qna_no);              		 // qan 게시글 삭제
	
	public int countQnaBoard();                                    	 // qna 총 갯수 출력
	
	public QnaDTO selectQnaPasswordCheck(QnaDTO qDto);               // qan의 비밀번호 일치 여부 확인
	
}
