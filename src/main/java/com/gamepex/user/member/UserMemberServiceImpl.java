package com.gamepex.user.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gamepex.share.MemberVO;

@Service
public class UserMemberServiceImpl implements UserMemberService {
	@Inject
	private UserMemberDAO userMemberDAO;	
	
	public MemberVO idCheck(String mb_id) {
		return userMemberDAO.idCheck(mb_id);
	}
}
