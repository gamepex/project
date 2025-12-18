package com.gamepex.admin.rental;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gamepex.share.RentDetailDTO;
import com.gamepex.share.RentalDTO;

@Repository
public class AdminRentalDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.gamepex.mappers.admin.rental";
	
	
	// 대여 내역
	public List<RentalDTO> getRentalList() throws Exception {
		return sqlSession.selectList(namespace+".getRentalList");
	}
	
	// 대여 내역 상세
	public List<RentalDTO> getRentalDetail(int rt_no) throws Exception {
		return sqlSession.selectList(namespace+".getRentalDetail", rt_no);
	}
//	
//	// 대여 현황 조회
//	public int getRentalState(String rd_serialno) throws Exception {
//		return sqlSession.selectOne(namespace+".getRentalState", rd_serialno);
//	}
//	
	// 대여 현황 수정
	public void setRentalState(int rt_no, int rt_state) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("rt_no", rt_no);
		params.put("rt_state", rt_state);
		sqlSession.update(namespace+".setRentalState", params);
	}
//	
//	// 콘솔 대여 현황 수정
//	public int setConsoleState(int currentState, String rd_serialno) throws Exception{
//		Map<String, Object> params = new HashMap<>();
//		params.put("currentState", currentState);
//		params.put("rd_serialno", rd_serialno);
//		return sqlSession.update(namespace+".setConsoleState", params);
//	}
//	
//	// 타이틀 대여 현황 수정
//	public int setTitleState(int currentState, String rd_serialno) throws Exception{
//		Map<String, Object> params = new HashMap<>();
//		params.put("currentState", currentState);
//		params.put("rd_serialno", rd_serialno);
//		return sqlSession.update(namespace+".setTitleState", params);
//	}
//	
	
	
}
