package kr.co.guide.travel.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ScheduleDTO {
	private int schedule_no;
	private String schedule_title;
	private Timestamp schedule_regist_date;
	private String schedule_start;
	private String schedule_end;
	private String schedule_recommend;
	private int schedule_viewcount;
	private String member_id;
}
