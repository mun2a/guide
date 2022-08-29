package kr.co.guide.qna.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReplyDTO {
	private String qna_reply_no;             // 답글 번호 시퀀스
	private String qna_reply_content;        // 답글 내용
	private Timestamp qna_reply_regist_date;    // 답글 등록일
	private String qna_no;					 //해당 게시글 번호
	private String member_id;                //FK 값
}
