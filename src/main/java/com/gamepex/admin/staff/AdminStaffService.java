package com.gamepex.admin.staff;

import java.util.List;

public interface AdminStaffService {

    // 직원 아이디 중복 확인
    boolean idCheck(String staff_id);

    // 직원 등록
    AdminStaffVO register(AdminStaffVO adminStaffVO);
    
    AdminStaffVO login(AdminStaffVO adminStaffVO);
    
    List<AdminStaffVO> getStaffList();

}