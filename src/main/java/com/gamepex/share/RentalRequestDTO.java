package com.gamepex.share;

import java.util.List;

import lombok.Data;

@Data
public class RentalRequestDTO {
	
	private RentalVO rentalInfo;
	private List<RentDetailVO> detailList;
}