package com.gamepex.user.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.MemberVO;

@Repository
public class UserMemberDAO {
	@Inject
	private SqlSession sqlSession;
	private static String namespace= "com.gamepex.mappers.user.member";
			
	public MemberVO idCheck(String mb_id) {
		return sqlSession.selectOne(namespace+".idcheck", mb_id);
	}
}