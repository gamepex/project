package com.gamepex.user.rental;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import com.gamepex.admin.console.AdminConsoleDAO;
import com.gamepex.admin.gametitle.AdminGameTitleDAO;
import com.gamepex.share.RentalDTO;
import com.gamepex.share.RentalVO;

@Service
public class UserRentalService {
	
	@Inject
	private UserRentalDAO userRentalDAO;
	@Inject
	private AdminConsoleDAO adminConsoleDAO;
	@Inject
	private AdminGameTitleDAO adminGameTitleDAO;

	public void register(RentalVO rentalVO) throws Exception {
		userRentalDAO.register(rentalVO);
	}
	
		
}

	
	
	

