package kr.co.guide.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AreaDTO {
	
	private String area_code;
	private String area_detail_code;
	private String area_english_title;
	private String area_image;
	private String area_content;
	private String area_name;
	private String area_detail_name;
	private String area_count;

}


