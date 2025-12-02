package com.gamepex.admin.staff;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.gamepex.dto.AdminStaffVO;

@Service
public class AdminStaffService {
	
	@Inject
	private AdminStaffDAO adminStaffDAO;
	
	// 직원 아이디 중복 확인
	public AdminStaffVO idCheck(String staff_id) {
		return adminStaffDAO.idCheck(staff_id);
	}

	// 직원 등록
	public int register(AdminStaffVO adminStaffVO) {
		return adminStaffDAO.register(adminStaffVO);
	}

}




















