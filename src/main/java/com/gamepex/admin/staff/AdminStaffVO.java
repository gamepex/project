package com.gamepex.admin.staff;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AdminStaffVO {
	private int staff_no;
    private String staff_id;
    private String staff_pw;
    private String staff_name;
    private String staff_gender;
    private LocalDate staff_birth;
    private String staff_mail;
    private String staff_phone;
    private String staff_part;
    private String staff_position;
    private int staff_state;
    private LocalDateTime staff_regdate;
    private LocalDateTime staff_moddate;
}