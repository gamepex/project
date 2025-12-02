package com.gamepex.admin.staff;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.gamepex.dto.AdminStaffVO;

public class AdminStaffDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.gamepex.mappers.admin.staff";

	// 직원 아이디 중복 확인
	public AdminStaffVO idCheck(String staff_id) {
		return sqlSession.selectOne(namespace+".idcheck", staff_id);
	}
	
	// 직원 등록
	public int register(AdminStaffVO adminStaffVO) {
		return sqlSession.insert(namespace+".register", adminStaffVO);
	}
}







