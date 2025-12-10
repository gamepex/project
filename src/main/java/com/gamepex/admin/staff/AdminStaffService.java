package com.gamepex.admin.staff;

import java.util.List;

public interface AdminStaffService {

    // 직원 아이디 중복 확인
    boolean idCheck(String staff_id);

    // 직원 등록
    AdminStaffVO register(AdminStaffVO adminStaffVO);
    
    // 로그인
    AdminStaffVO login(AdminStaffVO adminStaffVO);
    
    // 전체 직원 목록
    List<AdminStaffVO> getStaffList();
    
    // 직원 승인
  	int setApproval(String staff_id);
 	

}