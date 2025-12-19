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
	
	// 대여 내역
	public List<RentalDTO> getRentalList() throws Exception {
		return adminRentalDAO.getRentalList();
	}
	
	// 대여 현황 수정
	public void setRentalState(int rt_no, int rt_state) throws Exception {
		adminRentalDAO.setRentalState(rt_no, rt_state);
	}


}
