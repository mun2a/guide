package kr.co.guide.qna.mapper;

import java.util.List;
import java.util.Map;

import kr.co.guide.qna.domain.QnaDTO;

public interface QnaMapper {
	
	public int insertQnaBoard(QnaDTO qDto);              			 // qna 게시글 등록 기능
	
	public List<QnaDTO> selectQnaList(Map<String, Object> map);      // qna 모든 글 가져오기
	
	public QnaDTO selectQnaInfo(String qna_no);          			 // qna 상세글
	
	public int updateQnaBoard(QnaDTO qDto);              			 // qna 게시글 수정

	public int deleteQnaBoard(String qna_no);              			 // qna 게시글 삭제
	
	public int countQnaBoard();                                      // qna 총 갯수 출력
	
	public int updateQnaExist(QnaDTO qDto);               			 // qan에 댓글 존재 여부 변경
	
	public QnaDTO selectQnaPasswordCheck(QnaDTO qDto);               // qan의 비밀번호 일치 여부 확인
}
