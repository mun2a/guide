package kr.co.guide.admin.service.Impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.admin.domain.QnaCriteria;
import kr.co.guide.admin.domain.QnaDTO;
import kr.co.guide.admin.mapper.QnaMGMapper;
import kr.co.guide.admin.service.IQnaMGService;

@Service
public class QnaMGService implements IQnaMGService {
	
	@Autowired
	private QnaMGMapper qnaMapper;
	
	private static final Logger log = LoggerFactory.getLogger(QnaMGService.class);

	@Override
	public List<QnaDTO> list(QnaCriteria cri) throws Exception {
		log.info("QnaMGService......getListWithPaging..................");
		return qnaMapper.getListWithPaging(cri);
	}

	@Override
	public int totalCnt(QnaCriteria cri) throws Exception {
		log.info("QnaMGService......getTotalCnt..................");
		return qnaMapper.getTotalCnt(cri);
	}

	@Override
	public QnaDTO read(String qna_no) throws Exception {
		log.info("QnaMGService......detail..................");
		return qnaMapper.read(qna_no);
	}

	@Override
	public boolean removeQna(String qna_no) throws Exception {
		log.info("QnaMGService......removeQna..................");
		return qnaMapper.deleteQna(qna_no);
	}

}
