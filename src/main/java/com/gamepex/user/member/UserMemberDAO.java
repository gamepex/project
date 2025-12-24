package com.gamepex.user.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.MemberVO;

@Repository
public class UserMemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	static String namespace = "com.gamepex.mappers.user.member";
	
	public MemberVO getMember(String mb_id) {
		return sqlSession.selectOne(namespace + ".getMember", mb_id);
	}
	public int register(MemberVO memberVO) throws Exception{
		return sqlSession.insert(namespace + ".register",memberVO);
	}
	public MemberVO login(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(namespace+".login", memberVO);
	}
	public int resetPwd(MemberVO memberVO) throws Exception {
		return sqlSession.update(namespace+".resetPwd", memberVO);
	}
}
