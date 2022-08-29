package kr.co.guide.qna.mapper;

import java.util.List;

import kr.co.guide.qna.domain.QnaDTO;
import kr.co.guide.qna.domain.ReplyDTO;

public interface ReplyMapper {
	
	public int insertReplyBoard(ReplyDTO rDto);              			 // qna 댓글 등록 기능
	
	public List<ReplyDTO> selectReplyList(String qna_no);      		 	 // 해당 게시글의 모든 댓글 출력
	
	public ReplyDTO selectReplyInfo(String qna_reply_no);          	 	 // qna 댓글 상세글
	
	public int updateReplyBoard(ReplyDTO rDto);              			 // qna 댓글 수정

	public int deleteReplyBoard(ReplyDTO rDto);              			 // qna 댓글 삭제
	
	public int deleteAllReplyBoard(String qna_no);                       // 해당 게시물의 모든 댓글 삭제
	
}
