package com.gamepex.user.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gamepex.admin.staff.AdminStaffVO;
import com.gamepex.share.AddressDTO;
import com.gamepex.share.MemberVO;

@Service
public class UserMemberService {
	
	@Inject
	private UserMemberDAO userMemberDAO; 
	
	public int register(MemberVO memberVO) throws Exception{
		return userMemberDAO.register(memberVO);
	}
	public List<AddressDTO> getZipcode(AddressDTO addressDTO) throws Exception{
		return userMemberDAO.getZipcode(addressDTO);
	}
	public MemberVO login(MemberVO memberVO) throws Exception {
		return userMemberDAO.login(memberVO);
	}
	public int resetPwd(MemberVO memberVO) throws Exception {
		return userMemberDAO.resetPwd(memberVO);
	}
}
