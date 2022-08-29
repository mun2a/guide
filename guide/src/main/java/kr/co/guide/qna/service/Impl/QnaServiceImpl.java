package kr.co.guide.qna.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.guide.qna.domain.QnaDTO;
import kr.co.guide.qna.mapper.QnaMapper;
import kr.co.guide.qna.mapper.ReplyMapper;
import kr.co.guide.qna.service.IQnaService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaServiceImpl implements IQnaService {
	
	@Autowired
	private QnaMapper qnaMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	//qna 게시글 등록 
	@Override
	public boolean insertQnaBoard(QnaDTO qDto) {
		
		log.info("==================== service insertQnaBoard ====================");
		
		return qnaMapper.insertQnaBoard(qDto) == 1 ? true : false;
	}
	
	//qna 모든 게시글 출력
	@Override
	public List<QnaDTO> selectQnaList(Map<String, Object> map) {
		
		log.info("==================== service selectQnaList ====================");
		
		return qnaMapper.selectQnaList(map);
	}
	
	//qna 상세 게시글 출력
	@Override
	public QnaDTO selectQnaInfo(String qna_no) {

		log.info("==================== service selectQnaInfo ====================");
		
		return qnaMapper.selectQnaInfo(qna_no);
	}
	
	//qna 상세 게시글 수정
	@Override
	public boolean updateQnaBoard(QnaDTO qDto) {

		log.info("==================== service updateQnaBoard ====================");
		
		return qnaMapper.updateQnaBoard(qDto) == 1 ? true : false;
	}
	
	//qna 게시글 삭제
	@Transactional
	@Override
	public boolean delectQnaBoard(String qna_no) {

		log.info("==================== service delectQnaBoard ====================");
		//해당 게시글의 댓글 삭제
		replyMapper.deleteAllReplyBoard(qna_no);
		//해당 게시글 삭제
		qnaMapper.deleteQnaBoard(qna_no);
		return true;
	}
	
	//qna 게시글 총 갯수 출력
	@Override
	public int countQnaBoard() {

		log.info("==================== service countQnaBoard ====================");
		
		return qnaMapper.countQnaBoard();
	}
	
	// qan의 비밀번호 일치 여부 확인
	@Override
	public QnaDTO selectQnaPasswordCheck(QnaDTO qDto) {

		log.info("==================== service countQnaBoard ====================");
		
		return qnaMapper.selectQnaPasswordCheck(qDto);
	}

	
}
