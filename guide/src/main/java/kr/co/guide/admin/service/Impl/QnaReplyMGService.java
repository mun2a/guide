package kr.co.guide.admin.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.guide.admin.domain.QnaDTO;
import kr.co.guide.admin.domain.QnaReplyDTO;
import kr.co.guide.admin.mapper.QnaMGMapper;
import kr.co.guide.admin.mapper.QnaReplyMGMapper;
import kr.co.guide.admin.service.IQnaReplyMGService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaReplyMGService implements IQnaReplyMGService {
	
	@Autowired
	private QnaReplyMGMapper qrMapper;
	
	@Autowired
	private QnaMGMapper qMapper;
	
	@Override
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception {
		log.info("QnaReplyMGService......readReply..................");
		return qrMapper.readReply(qna_no);
	}

	@Transactional
	@Override
	public int addQnaReply(QnaReplyDTO qrDto) {
		log.info("QnaReplyMGService...........addQnaReply..................");
		int result = qrMapper.insertQnaReply(qrDto);
		
		QnaDTO qDto = new QnaDTO();
		qDto.setQna_no(qrDto.getQna_no());
		qDto.setQna_reply_exist("Y");
		qMapper.updateQnaExist(qDto);
		
		return result;
	}

	@Override
	public int modifyQnaReply(QnaReplyDTO qrDto) {
		log.info("QnaReplyMGService...........modifyQnaReply..................");
		return qrMapper.updateQnaReply(qrDto);
	}

	@Transactional
	@Override
	public int removeQnaReply(QnaReplyDTO qrDto) {
		log.info("QnaReplyMGService...........removeQnaReply..................");
		int result = qrMapper.deleteQnaReply(qrDto.getQna_reply_no());
		
		//댓글 삭제후 해당 게시물에 댓글이 존재하지 않을 경우
		int countQnaReply = qrMapper.countQnaReply(qrDto.getQna_no());
		if (countQnaReply == 0) {
			QnaDTO qDto = new QnaDTO();
			qDto.setQna_no(qrDto.getQna_no());
			qDto.setQna_reply_exist("N");
			qMapper.updateQnaExist(qDto);
		}
		
		return result;
	}

}
