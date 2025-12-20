package com.gamepex.admin.rental;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamepex.share.RentalDTO;

@Service
public class AdminRentalService {
	
	@Inject
	private AdminRentalDAO adminRentalDAO;
	
	public List<RentalDTO> getRentalList()throws Exception{
		return adminRentalDAO.getRentalList();
	}

	public RentalDTO getRentalOne(int rt_no)throws Exception{
		return adminRentalDAO.getRentalOne(rt_no);
	}
	
	public void setRentalState(int rt_no, int rt_state)throws Exception{
		adminRentalDAO.setRentalState(rt_no, rt_state);
	}


}
