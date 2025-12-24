package com.gamepex.user.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.gamepex.share.MemberVO;

@Service
public class UserMemberService {
	
	@Inject
	private UserMemberDAO userMemberDAO; 

	public MemberVO getMember(String mb_id) {
		return userMemberDAO.getMember(mb_id);
	}
	public int register(MemberVO memberVO) throws Exception{
		return userMemberDAO.register(memberVO);
	}
	public MemberVO login(MemberVO memberVO) throws Exception {
		return userMemberDAO.login(memberVO);
	}
	public int resetPwd(MemberVO memberVO) throws Exception {
		return userMemberDAO.resetPwd(memberVO);
	}
}
