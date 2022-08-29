package kr.co.guide.qna.service;

import java.util.List;

import kr.co.guide.qna.domain.QnaDTO;
import kr.co.guide.qna.domain.ReplyDTO;

public interface IReplyService {
	
	public boolean insertReplyBoard(ReplyDTO rDto);              			 	 // qna 댓글 등록 기능
	
	public List<ReplyDTO> selectReplyList(String qna_no);      		 	 // 해당 게시글의 모든 댓글 출력
	
	public ReplyDTO selectReplyInfo(String qna_reply_no);          	 	 // qna 댓글 상세글
	
	public boolean updateReplyBoard(ReplyDTO rDto);              			 // qna 댓글 수정

	public boolean delectReplyBoard(ReplyDTO rDto);              		 // qna 댓글 삭제
}
