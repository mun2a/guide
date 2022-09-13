package kr.co.guide.admin.service.Impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.admin.domain.QnaReplyDTO;
import kr.co.guide.admin.mapper.QnaReplyMGMapper;
import kr.co.guide.admin.service.IQnaReplyMGService;

@Service
public class QnaReplyMGService implements IQnaReplyMGService {
	
	@Autowired
	private QnaReplyMGMapper mapper;
	
	private static final Logger log = LoggerFactory.getLogger(QnaReplyMGService.class);

	@Override
	public List<QnaReplyDTO> readReply(String qna_no) throws Exception {
		log.info("QnaReplyMGService......readReply..................");
		return mapper.readReply(qna_no);
	}

}
