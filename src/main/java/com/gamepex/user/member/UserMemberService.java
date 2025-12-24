package com.gamepex.user.member;

import com.gamepex.share.MemberVO;

public interface UserMemberService {

    // 회원 아이디 중복 확인
    boolean idCheck(String mb_id);

    // 회원 가입
    MemberVO register(MemberVO memberVO);
    
    // 회원 로그인
    MemberVO login(MemberVO memberVO);

    // 회원 정보 수집
  	MemberVO getMember(String mb_id);

  	// 회원 수정 처리
  	int modifyMember(MemberVO memberVO);

    // 회원 삭제
  	int deleteMember(String mb_id);
    
}
