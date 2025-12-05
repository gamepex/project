package com.gamepex.admin.staff;

public interface AdminStaffService {

    // 직원 아이디 중복 확인
    boolean idCheck(String staff_id);

    // 직원 등록
    boolean register(AdminStaffVO adminStaffVO);
    
    AdminStaffVO login(AdminStaffVO adminStaffVO);

}