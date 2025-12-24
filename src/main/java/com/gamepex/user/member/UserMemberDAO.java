package com.gamepex.user.member;

import org.apache.ibatis.annotations.Mapper;

import com.gamepex.share.MemberVO;

@Mapper
public interface UserMemberDAO {
    
    // 회원 아이디 중복 확인
    int idCheck(String mb_id);

    // 회원 가입
    int register(MemberVO memberVO);
    
    // 회원 정보 수집
    MemberVO getMember(String mb_id);
    
    // 회원 수정 처리
    int modifyMember(MemberVO memberVO);

    // 회원 삭제
    int deleteMember(String mb_id);
}
