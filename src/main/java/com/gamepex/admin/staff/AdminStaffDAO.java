package com.gamepex.admin.staff;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminStaffDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.gamepex.mappers.adminStaff";

	// 직원 아이디 중복 확인
	public int idCheck(String staff_id) {
		return sqlSession.selectOne(namespace + ".idCheck", staff_id);
	}
	
	// 직원 등록
	public int register(AdminStaffVO adminStaffVO) {
		return sqlSession.insert(namespace+".register", adminStaffVO);
	}
	
	
	// 로그인
	public AdminStaffVO login(String staff_id) {
		return sqlSession.selectOne(namespace+".login", staff_id);
	}
	
	// 전체 직원 목록
	public List<AdminStaffVO> getStaffList() {
		return sqlSession.selectList(namespace + ".getStaffList");
	}
}