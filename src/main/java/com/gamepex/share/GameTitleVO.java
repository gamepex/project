package com.gamepex.share;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class GameTitleVO {
	private String ttl_serial;
	private String staff_id;
	private String ttl_name;
	private String ttl_platform;
	private String ttl_genre;
	private int ttl_stock;
	private int ttl_price;
	private String ttl_thumbnail;
	private String ttl_content;
	private int ttl_state;
	private LocalDateTime ttl_regdate;
	private LocalDateTime ttl_moddate; 
}
