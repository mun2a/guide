package kr.co.guide.qna.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.guide.qna.domain.QnaDTO;
import kr.co.guide.qna.domain.ReplyDTO;
import kr.co.guide.qna.mapper.QnaMapper;
import kr.co.guide.qna.mapper.ReplyMapper;
import kr.co.guide.qna.service.IReplyService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements IReplyService{
	
	@Autowired
	ReplyMapper replyMapper;
	
	@Autowired
	QnaMapper qnaMapper;
	
	
	//댓글 등록 기능
	@Transactional
	@Override
	public boolean insertReplyBoard(ReplyDTO rDto) {

		log.info("==================== service insertReplyBoard ====================");
		
		replyMapper.insertReplyBoard(rDto);
		
		QnaDTO qDto = new QnaDTO();
		qDto.setQna_no(rDto.getQna_no());
		qDto.setQna_reply_exist("Y");
		qnaMapper.updateQnaExist(qDto);
		
		return true;
	}
	
	//해당 게시글의 모든 댓글 출력
	@Override
	public List<ReplyDTO> selectReplyList(String qna_no) {

		log.info("==================== service selectReplyList ====================");
		
		return replyMapper.selectReplyList(qna_no);
	}
	
	//해당 상세 댓글 출력
	@Override
	public ReplyDTO selectReplyInfo(String qna_reply_no) {

		log.info("==================== service selectReplyInfo ====================");
		
		return replyMapper.selectReplyInfo(qna_reply_no);
	}
	
	//댓글 수정
	@Override
	public boolean updateReplyBoard(ReplyDTO rDto) {

		log.info("==================== service updateReplyBoard ====================");
		
		return replyMapper.updateReplyBoard(rDto) == 1 ? true : false;
	}
	
	//댓글 삭제
	@Transactional
	@Override
	public boolean delectReplyBoard(ReplyDTO rDto) {

		log.info("==================== service delectReplyBoard ====================");
		
		replyMapper.deleteReplyBoard(rDto);
		
		//댓글 삭제후 해당 게시물에 댓글이 존재하지 않을 경우
		if(replyMapper.selectReplyList(rDto.getQna_no()).size() == 0) {
			QnaDTO qDto = new QnaDTO();
			qDto.setQna_no(rDto.getQna_no());
			qDto.setQna_reply_exist("N");
			qnaMapper.updateQnaExist(qDto);
		}
		
		return true;
	}

}
