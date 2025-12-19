package com.gamepex.user.rental;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.RentalVO;

@Repository
public class UserRentalDAO {
	
	@Inject
	private SqlSession sqlSession;
	@Inject
	private static String namespace="com.gamepex.mappers.user.rental";
	
	public void register(RentalVO rentalVO) throws Exception {
		sqlSession.insert(namespace+".register",rentalVO);
	}

	//private void setRentalState(String con_serial) throws Exception {
	//	sqlSession.update(namespace+".setRentalState", con_serial);
	//}

}
