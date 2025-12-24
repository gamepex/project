package com.gamepex.share;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberVO {
	private String mb_id;
	private String mb_pw;
	private String mb_nickname;
	private String mb_name;
	private String mb_gender;
	private LocalDate mb_birth;
	private String mb_mail;
	private String mb_phone;
	private String mb_zipcode;
	private String mb_addr;
	private String mb_addr_detail;
	private int mb_grade;
	private int mb_state;
	private LocalDateTime mb_regdate;
	private LocalDateTime mb_moddate;
}