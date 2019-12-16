package com.icia.fontExample.Service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;

@Service
public class ChangePwdService {
	@Autowired
	private ChangePwdDao dao;
	@Autowired
	private LoginDao loginDao;
	@Autowired
	private PasswordEncoder pwdEncoder;

	public String changePwd(String username, String password, String newPassword) {
		String encodedPassword = dao.findById(username).getPassword();
		if(pwdEncoder.matches(password, encodedPassword)==false)
			throw new IllegalArgumentException("비밀번호를 확인하지 못했습니다");
		
		dao.changePwd(username, pwdEncoder.encode(newPassword));
		return "OK";
	}
	
	public String notLoginChangePwd(String newPassword,String username) {
		String encodedPassword = pwdEncoder.encode(newPassword);
		dao.changePwd(username, encodedPassword);
		loginDao.resetLoginFailureCount(username);
		loginDao.unBlock(username);
		return "OK";
	}
}
