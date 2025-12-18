package com.gamepex.share;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ConsoleVO {
	
	 private String con_serial;
	 private String staff_id;
	 private String con_name;
	 private String con_platform;
	 private int con_price;
	 private String con_thumbnail;
	  private String con_content;
	  private int con_stock;
	  private int con_state;
	  private LocalDateTime con_regdate;
	  private LocalDateTime con_moddate;
}
