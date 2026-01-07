package com.gamepex.user.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.CartVO;

@Repository
public class UserCartDAO {
	
	@Inject
	private SqlSession sqlSession;
	@Inject
	private static String namespace="com.gamepex.mapeprs.user.cart";

	public List<CartVO> getCartList(String mb_id)throws Exception{
		return sqlSession.selectList(namespace+".getCartList", mb_id);
	}
	public void cartReg(CartVO cartVO)throws Exception{
		sqlSession.insert(namespace+".cartReg", cartVO);
	}
}
