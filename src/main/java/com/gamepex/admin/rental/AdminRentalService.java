package com.gamepex.admin.rental;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamepex.share.RentDetailDTO;
import com.gamepex.share.RentalDTO;

@Service
public class AdminRentalService {
	
	@Inject
	private AdminRentalDAO adminRentalDAO;
	
	// 대여 내역
	public List<RentalDTO> getRentalList() throws Exception {
		return adminRentalDAO.getRentalList();
	}
	
	// 대여 내역 상세
	public List<RentalDTO> getRentalDetail(int rt_no) throws Exception {
		return adminRentalDAO.getRentalDetail(rt_no);
	}
//	
//	// 대여 현황 조회
//	public int getRentalState(String rd_serialno) throws Exception {
//		return adminRentalDAO.getRentalState(rd_serialno);
//	}
//	
	// 대여 현황 수정
	public void setRentalState(int rt_no, int rt_state) throws Exception {
		adminRentalDAO.setRentalState(rt_no, rt_state);
	}
//	
//	// 콘솔 대여 현황 수정
//	public int setConsoleState(int currentState, String rd_serialno) throws Exception{
//		return adminRentalDAO.setConsoleState(currentState, rd_serialno);
//	}
//	
//	// 타이틀 대여 현황 수정
//	public int setTitleState(int currentState, String rd_serialno) throws Exception{
//		return adminRentalDAO.setTitleState(currentState, rd_serialno);
//	}
	

}
