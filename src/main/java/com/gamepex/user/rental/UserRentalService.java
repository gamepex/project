package com.gamepex.user.rental;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gamepex.share.RentalDTO;
import com.gamepex.share.RentalVO;

@Service
public class UserRentalService {
	
	@Inject
	private UserRentalDAO userRentalDAO;

	public void register(RentalVO rentalVO) throws Exception {
		userRentalDAO.register(rentalVO);
	}
	public RentalDTO getLatestRental(String mb_id) throws Exception {
		return userRentalDAO.getLatestRental(mb_id);
	}
	
		
}

	
	
	

