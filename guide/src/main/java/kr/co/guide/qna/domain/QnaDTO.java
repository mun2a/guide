package kr.co.guide.qna.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QnaDTO {
	private String qna_no;              //게시판 번호 시퀀스
	private String qna_title;           //게시판 제목  ( 123 으로 구분할거임)
	private String qna_content;         //게시판 내용
	private Timestamp qna_regist_date;  //게시판 등록일
	private String qna_write;           //게시판 작성자 아이디
	private String qna_write_name;      //게시판 작성자 이름 (비회원은 비회원)
	private String qna_secret;          //게시판 비밀글 여부
	private String qna_password;        //게시판 비밀번호
	private String qna_reply_exist;     //게시판 댓글 존재 여부
	
	private List<ReplyDTO> replyList;   //게시판 답글 리스트
}
