package com.gamepex.admin.staff;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminStaffServiceImpl implements AdminStaffService {
	
    @Inject
    private AdminStaffDAO adminStaffDAO;
    
    @Inject
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
    // 직원 아이디 중복 확인
    @Override
    public boolean idCheck(String staff_id) {
        return adminStaffDAO.idCheck(staff_id) > 0;
    }

    // 직원 등록
    @Override
    public boolean register(AdminStaffVO adminStaffVO) {
    	String rawPw = adminStaffVO.getStaff_pw();
        String encPw = bCryptPasswordEncoder.encode(rawPw);
        adminStaffVO.setStaff_pw(encPw);
        return adminStaffDAO.register(adminStaffVO) != 0;
    }
    
    
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
	
}

class LoginException extends RuntimeException {
	private static final long serialVersionUID = 1L;
    public LoginException(String message) {
        super(message);
    }
}