package com.gamepex.admin.staff;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminStaffDAO {

    // 직원 아이디 중복 확인
    int idCheck(String staff_id);

    // 직원 등록
    int register(AdminStaffVO adminStaffVO);

    // 로그인
    AdminStaffVO login(String staff_id);

    // 전체 직원 목록
    List<AdminStaffVO> getStaffList();

    // 직원 승인
    int setApproval(String staff_id);
    
}