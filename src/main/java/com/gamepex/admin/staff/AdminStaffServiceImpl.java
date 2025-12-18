package com.gamepex.admin.staff;

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
    	
    	// 비밀번호 암호화
    	String rawPw = adminStaffVO.getStaff_pw();
        String encPw = bCryptPasswordEncoder.encode(rawPw);
        adminStaffVO.setStaff_pw(encPw);

        // 전화번호 하이픈 제거
        String phone = adminStaffVO.getStaff_phone().replaceAll("-", "");
        adminStaffVO.setStaff_phone(phone);
        
        // 등록 실패시 null 리턴.
        int result = adminStaffDAO.register(adminStaffVO);
        if (result == 0) {
            return null;
        }
        
        adminStaffVO.setStaff_pw(null);
        return adminStaffVO;
    }
    
    
    //로그인
    @Override
    public AdminStaffVO login(AdminStaffVO adminStaffVO) {
        AdminStaffVO dbStaffVO = adminStaffDAO.login(adminStaffVO.getStaff_id());

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
    public LoginException(String message) {
        super(message);
    }
}