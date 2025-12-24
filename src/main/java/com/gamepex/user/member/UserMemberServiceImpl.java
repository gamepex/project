package com.gamepex.user.member;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gamepex.share.MemberVO;

@Service
public class UserMemberServiceImpl implements UserMemberService {
  
    @Autowired
    private UserMemberDAO userMemberDAO;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    // 회원 아이디 중복 확인
    @Override
    public boolean idCheck(String mb_id) {
        return userMemberDAO.idCheck(mb_id) > 0; // 중복이면 true가 return됨.
    }

    // 회원 가입
    @Override
    public MemberVO register(MemberVO memberVO) {

        validateRegister(memberVO);
    	
    	// 비밀번호 암호화
    	String rawPw = memberVO.getMb_pw();
        String encPw = bCryptPasswordEncoder.encode(rawPw);
        memberVO.setMb_pw(encPw);
        
    
        int result = userMemberDAO.register(memberVO);
        
        // 등록 실패시 null 리턴.
        if (result == 0) return null;
        
        memberVO.setMb_pw(null);
        return memberVO;
    }

    //유효성 검증 및 정규화
    private void validateRegister(MemberVO svo) {

        // 1) 아이디
        String id = secureTrim(svo.getMb_id(), "아이디를 입력하세요.");
        if (id.length() < 4 || id.length() > 20) throw new IllegalArgumentException("아이디는 4~20자여야 합니다.");
        if (!id.matches("^[a-z0-9]+$")) throw new IllegalArgumentException("아이디는 영문 소문자/숫자만 가능합니다.");
        if (userMemberDAO.idCheck(id) > 0) throw new IllegalArgumentException("이미 사용 중인 아이디입니다.");
        svo.setMb_id(id);
        // 2) 비밀번호
        String pw = svo.getMb_pw();
        if (pw == null || pw.isEmpty()) throw new IllegalArgumentException("비밀번호를 입력하세요.");
        if (pw.length() < 4 || pw.length() > 20) throw new IllegalArgumentException("비밀번호는 4~20자여야 합니다.");

        // 3) 이름
        String name = secureTrim(svo.getMb_name(), "이름을 입력하세요.");
        if (name.length() > 20) throw new IllegalArgumentException("이름은 20자 이하여야 합니다.");
        svo.setMb_name(name);

        // 4) 성별
        String gender = svo.getMb_gender();
        if (!(gender.equals("m") || gender.equals("f"))) throw new IllegalArgumentException("성별을 선택하세요.");

        // 5) 생년월일
        LocalDate birth = svo.getMb_birth();
        if (birth == null) throw new IllegalArgumentException("생년월일을 입력하세요.");

        // 6) 전화번호
        String phone = secureTrim(svo.getMb_phone(), "전화번호를 입력하세요.");
        String digits = phone.replaceAll("-", ""); // 전화번호 하이픈 제거
        if (digits.length() < 9) throw new IllegalArgumentException("전화번호 형식이 올바르지 않습니다.");
        svo.setMb_phone(digits);

        // 7) 이메일
        String email = secureTrim(svo.getMb_mail(), "이메일을 입력하세요.");
        // 이메일 검증 라이브러리 추가하기
    }

    // 공백 제거용
    private String secureTrim(String str, String msg) {
        if (str == null) throw new IllegalArgumentException(msg);
        str = str.trim();
        if (str.isEmpty()) throw new IllegalArgumentException(msg);
        return str;
    }

    // 회원 로그인
    @Override
    public MemberVO login(MemberVO memberVO) {
        MemberVO dbMemberVO = userMemberDAO.getMember(memberVO.getMb_id());

        if (dbMemberVO == null) {
            throw new LoginException("ID가 존재하지 않습니다.");
        }

        boolean match = bCryptPasswordEncoder.matches(memberVO.getMb_pw(), dbMemberVO.getMb_pw());
        if (!match) {
            throw new LoginException("비밀번호가 틀렸습니다.");
        }

        dbMemberVO.setMb_pw(null);
        return dbMemberVO;
    }

    // 회원 정보 수집
    @Override
  	public MemberVO getMember(String mb_id) {
        MemberVO memberVO = userMemberDAO.getMember(mb_id);
        if (memberVO != null) memberVO.setMb_pw(null);
        return memberVO;
    }

    // 회원 수정 처리
    @Override
   	public int modifyMember(MemberVO memberVO) {
    	return userMemberDAO.modifyMember(memberVO);
    }

    // 회원 삭제
    @Override
  	public int deleteMember(String mb_id) {
        return userMemberDAO.deleteMember(mb_id);
    }

}



//로그인 실패 메시지 클래스
class LoginException extends RuntimeException {
	private static final long serialVersionUID = 1L;
    public LoginException(String msg) {
        super(msg);
    }
}