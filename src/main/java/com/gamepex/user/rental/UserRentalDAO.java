package com.gamepex.user.rental;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.RentDetailVO;
import com.gamepex.share.RentalVO;

@Repository
public class UserRentalDAO {
	
	@Inject
	private SqlSession sqlSession;
	@Inject
	private static String namespace="com.gamepex.mappers.user.rental";
	
	public int register(RentalVO rentalInfo) throws Exception {
		return sqlSession.insert(namespace+".register",rentalInfo);
	}
	public void registerDetail(List<RentDetailVO> detailList) throws Exception {
		sqlSession.insert(namespace+".registerDetail", detailList);
	}
	//private void setRentalState(String con_serial) throws Exception {
	//	sqlSession.update(namespace+".setRentalState", con_serial);
	//}

}
