package com.gamepex.user.rental;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.RentalDTO;
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
	public RentalDTO getLatestRental(String mb_id) throws Exception {
		return sqlSession.selectOne(namespace+".getLatestRental", mb_id);
	}
	//private void setRentalState(String con_serial) throws Exception {
	//	sqlSession.update(namespace+".setRentalState", con_serial);
	//}

}
