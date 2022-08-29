package kr.co.guide.admin.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnaDTO {

	private String qna_no;             
	private String qna_title; 
	private String qna_content;  
	private Timestamp qna_regist_date;
	private String qna_write; 
	private String qna_write_name;  
	private String qna_secret;  
	private String qna_password;   
	private String qna_reply_exist;
	
	private List<QnaReplyDTO> replyList; 
	
}
