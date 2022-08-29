package kr.co.guide.qna.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class QnaCriteria {
	   private int pageNum;    // 현재 페이지 정보
	   private int amount;     // 출력할 양
	   
	   //처음 게시판에 진입했을때 작동 page = 1 , amount = 10    
	   public QnaCriteria() {
	      this(1,10);
	   }
	   
	   // 추후 페이지 변경이나 amount 값 조절로 내가 커스텀해서 화면에 뿌리기
	   public QnaCriteria(int pageNum, int amount) {
	      this.pageNum = pageNum;
	      this.amount = amount;
	   }
	   
	   // 추후 페이지 변경이나 amount 값 조절로 내가 커스텀해서 화면에 뿌리기 정렬포함   
	   public QnaCriteria(int pageNum, int amount, String sort) {
		      this.pageNum = pageNum;
		      this.amount = amount;
	   }
	   
	   
	   //UriComponentsBuilder를 이용하여 링크 생성
	   //이 메서드를 실행시키면 자동으로 url 형식으로 인코딩해줌
	   // ex) ?pageNum=3&amount=20&type=TC&keyword=%EC%83%88%EB%A1%9C
	   public String getListLink() {
		   UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				   .queryParam("pageNum", this.pageNum);
		   return builder.toUriString();
	   }
	   
	   public String getProductListLink() {
		   UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				   .queryParam("pageNum", this.pageNum);
		   return builder.toUriString();
	   }
}
