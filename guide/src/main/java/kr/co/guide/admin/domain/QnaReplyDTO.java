package kr.co.guide.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnaReplyDTO {

	private String qna_reply_no;
	private String qna_reply_content;       
	private String qna_reply_regist_date; 
	private String qna_no;
	private String member_id;  
	
}
