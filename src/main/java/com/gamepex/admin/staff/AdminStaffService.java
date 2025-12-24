package com.gamepex.admin.staff;

import java.util.List;

public interface AdminStaffService {

    // 직원 아이디 중복 확인
    boolean idCheck(String staff_id);

    // 직원 가입
    AdminStaffVO register(AdminStaffVO adminStaffVO);
    
    // 직원 로그인
    AdminStaffVO login(AdminStaffVO adminStaffVO);
    
    // 직원 목록
    List<AdminStaffVO> getStaffList();
    
    // 직원 승인
  	int setApproval(String staff_id);
  	
  	// 직원 삭제
  	int deleteStaff(String staff_id);
  	
  	// 직원 정보 수집
  	AdminStaffVO getStaff(String staff_id);
  	
  	// 직원 수정 처리
  	int modifyStaff(AdminStaffVO adminStaffVO);
 	

}