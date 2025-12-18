package com.gamepex.share;

import lombok.Data;

@Data
public class RentDetailVO {

	private int rd_no;	
	private int rt_no;
	private String rd_type; // ('ps5', 'xbox', 'nintendo', 'vr', 'steamdeck' != )
	private String rd_serial; // 해당 타입 테이블의 pk 값
	private int rd_price;
	private int rd_quantity;
}
