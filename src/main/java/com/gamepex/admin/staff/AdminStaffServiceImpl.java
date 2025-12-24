package com.gamepex.admin.staff;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminStaffServiceImpl implements AdminStaffService {

    @Autowired
    private AdminStaffDAO adminStaffDAO;
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
    // 직원 아이디 중복 확인
    @Override
    public boolean idCheck(String staff_id) {
        return adminStaffDAO.idCheck(staff_id) > 0; // 중복이면 true가 return됨.
    }   

    // 직원 등록
    @Override
    public AdminStaffVO register(AdminStaffVO adminStaffVO) {

        validateRegister(adminStaffVO);
    	
    	// 비밀번호 암호화
    	String rawPw = adminStaffVO.getStaff_pw();
        String encPw = bCryptPasswordEncoder.encode(rawPw);
        adminStaffVO.setStaff_pw(encPw);
        
    
        int result = adminStaffDAO.register(adminStaffVO);
        
        // 등록 실패시 null 리턴.
        if (result == 0) return null;
        
        adminStaffVO.setStaff_pw(null);
        return adminStaffVO;
    }

    //유효성 검증 및 정규화
    private void validateRegister(AdminStaffVO svo) {

        // 1) 아이디
        String id = secureTrim(svo.getStaff_id(), "아이디를 입력하세요.");
        if (id.length() < 4 || id.length() > 20) throw new IllegalArgumentException("아이디는 4~20자여야 합니다.");
        if (!id.matches("^[a-z0-9]+$")) throw new IllegalArgumentException("아이디는 영문 소문자/숫자만 가능합니다.");
        if (adminStaffDAO.idCheck(id) > 0) throw new IllegalArgumentException("이미 사용 중인 아이디입니다.");
        svo.setStaff_id(id);

        // 2) 비밀번호
        String pw = svo.getStaff_pw();
        if (pw == null || pw.isEmpty()) throw new IllegalArgumentException("비밀번호를 입력하세요.");
        if (pw.length() < 4 || pw.length() > 20) throw new IllegalArgumentException("비밀번호는 4~20자여야 합니다.");

        // 3) 이름
        String name = secureTrim(svo.getStaff_name(), "이름을 입력하세요.");
        if (name.length() > 20) throw new IllegalArgumentException("이름은 20자 이하여야 합니다.");
        svo.setStaff_name(name);

        // 4) 성별
        String gender = svo.getStaff_gender();
        if (!(gender.equals("m") || gender.equals("f"))) throw new IllegalArgumentException("성별을 선택하세요.");

        // 5) 생년월일
        LocalDate birth = svo.getStaff_birth();
        if (birth == null) throw new IllegalArgumentException("생년월일을 입력하세요.");

        // 6) 전화번호
        String phone = secureTrim(svo.getStaff_phone(), "전화번호를 입력하세요.");
        String digits = phone.replaceAll("-", ""); // 전화번호 하이픈 제거
        if (digits.length() < 9) throw new IllegalArgumentException("전화번호 형식이 올바르지 않습니다.");
        svo.setStaff_phone(digits);

        // 7) 이메일
        String email = secureTrim(svo.getStaff_mail(), "이메일을 입력하세요.");
        // 이메일 검증 라이브러리 추가하기
    }

    // 공백 제거용
    private String secureTrim(String str, String msg) {
        if (str == null) throw new IllegalArgumentException(msg);
        str = str.trim();
        if (str.isEmpty()) throw new IllegalArgumentException(msg);
        return str;
    }

    
    // 직원 로그인
    @Override
    public AdminStaffVO login(AdminStaffVO adminStaffVO) {
        AdminStaffVO dbStaffVO = adminStaffDAO.getStaff(adminStaffVO.getStaff_id()); // 직원 정보 수집과 메서드 공유

        if (dbStaffVO == null) {
            throw new LoginException("ID가 존재하지 않습니다.");
        }

        boolean match = bCryptPasswordEncoder.matches(adminStaffVO.getStaff_pw(), dbStaffVO.getStaff_pw());
        if (!match) {
            throw new LoginException("비밀번호가 틀렸습니다.");
        }

        dbStaffVO.setStaff_pw(null);
        return dbStaffVO;
    }
    
    // 전체 직원 목록
    @Override
 	public List<AdminStaffVO> getStaffList() {
 		return adminStaffDAO.getStaffList();
 	}
    
    // 직원 승인
    @Override
 	public int setApproval(String staff_id) {
 		return adminStaffDAO.setApproval(staff_id);
 	}
    
    // 직원 삭제
    @Override
 	public int deleteStaff(String staff_id) {
 		return adminStaffDAO.deleteStaff(staff_id);
 	}
    
    // 직원 정보 수집
    @Override
    public AdminStaffVO getStaff(String staff_id) {
        AdminStaffVO adminStaffVO = adminStaffDAO.getStaff(staff_id);
        if (adminStaffVO != null) adminStaffVO.setStaff_pw(null);
        return adminStaffVO;
    }
    
    // 직원 수정 처리
    @Override
   	public int modifyStaff(AdminStaffVO adminStaffVO) {
    	return adminStaffDAO.modifyStaff(adminStaffVO);
    }
	
}



//로그인 실패 메시지 클래스
class LoginException extends RuntimeException {
	private static final long serialVersionUID = 1L;
    public LoginException(String msg) {
        super(msg);
    }
}