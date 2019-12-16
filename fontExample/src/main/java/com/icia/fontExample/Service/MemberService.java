package com.icia.fontExample.Service;

import java.io.*;
import java.util.*;

import javax.mail.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.*;
import org.springframework.web.client.*;
import org.springframework.web.multipart.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;
import com.icia.fontExample.util.*;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private LoginDao loginDao;
	@Autowired
	private CertificationDao certificationDao;
	@Autowired
	private PasswordEncoder pwdEncoder;
	@Autowired
	private MailUtil mailUtil;
	@Autowired
	@Value("#{config['upload.profile.folder']}")
	private String PROFILE_FOLDER;
	@Value("#{config['download.profile.uri']}")
	private String PROFILE_URI;
	@Value("#{config['login.cnt.silver']}")
	private int LOGIN_CNT_FOR_SILVER;
	@Value("#{config['write.cnt.silver']}")
	private int WRITE_CNT_FOR_SILVER;
	@Value("#{config['login.cnt.gold']}")
	private int LOGIN_CNT_FOR_GOLD;
	@Value("#{config['write.cnt.gold']}")
	private int WRITE_CNT_FOR_GOLD;

	@Transactional
	public Member insert(Member member) throws IllegalStateException, IOException {
		member.setPassword(pwdEncoder.encode(member.getPassword()));
		member.setEnabled(1);
		memberDao.insert(member);
		authorityDao.insert(member.getUsername(), "ROLE_MEMBER");
		certificationDao.certification_Insert(member.getUsername());
		RestTemplate tpl = new RestTemplate();
		tpl.postForObject("http://localhost:8081/fontExample/api/statistics/join", null,Integer.class);
		return memberDao.findById(member.getUsername());
	}

	public String findId(String name, String tel) throws MessagingException {
		String result = memberDao.findUsernameByNameAndTel(name, tel);
		if (result == null)
			throw new IllegalArgumentException("사용자를 찾지 못했습니다");
		else {
			return result;
		}
	}
	public String changePwd(String name, String tel) throws MessagingException {
		String result = memberDao.changePwd(name, tel);
		if (result == null)
			throw new IllegalArgumentException("사용자를 찾지 못했습니다");
		else {
			return result;
		}
	}
	
	
	
	
	

	public String pwdCheck(String username, String password) {
		String encodedPassword = memberDao.findPasswordById(username);
		if (pwdEncoder.matches(password, encodedPassword) == false)
			throw new IllegalArgumentException("비밀번호를 확인하지 못했습니다");
		return "OK";
	}

	public Member readme(String username) {
		Member member = memberDao.findById(username);
		return member;
	}

	public String updateName(String username, String name) {
		if (memberDao.updateName(username, name) == 0)
			throw new IllegalArgumentException("이름을 변경하지 못했습니다");
		return "OK";
	}

	public String updatePassword(String username, String password, String newPassword) {
		String encodedPassword = memberDao.findById(username).getPassword();
		if (pwdEncoder.matches(password, encodedPassword) == false)
			throw new IllegalArgumentException("비밀번호를 확인하지 못했습니다");
		memberDao.updatePassword(username, pwdEncoder.encode(password));
		return "OK";
	}

	public Member update(Member member, MultipartFile sajin) throws IllegalStateException, IOException {
		if (memberDao.update(member) == 0)
			throw new IllegalArgumentException("사용자 정보를 변경하지 못했습니다");
		if (sajin != null) {
			if (sajin.getContentType().toLowerCase().startsWith("image/")) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot);
				String imageName = member.getUsername() + extension;
				File file = new File(PROFILE_FOLDER, imageName);
				sajin.transferTo(file);
				String fileUrl = PROFILE_URI + imageName;
				// member.setProfile(fileUrl);
			}
		}
		return memberDao.findById(member.getUsername());
	}

	public List<Member> findAll() {
		return memberDao.findAllMember();
	}

	public Member memberBlock(String username, int block) {
		block = memberDao.selectBlock(username);
		if(block == 1)
			throw new IllegalArgumentException("이미 정지를 한 상태입니다.");
		memberDao.block(username);
		return null;
	}

	public Member memberUnBlock(String username, int block) {
		block = memberDao.selectBlock(username);
		if(block == 0) {
			throw new IllegalArgumentException("이미 정지를 풀어진 상태입니다.");
		}
		memberDao.unBlock(username);
		return null;
	}

	public Member findMemberByUsername(String username) {
		return memberDao.findMemberByUsername(username);
	}

	public String emailCertification(String email, String random) throws MessagingException {
		String text = "<p>인증번호가 발급되었습니다</p>";
		text += "<p>인증번호 : " + random + "</p>";
		text += "<p>인증번호를 내정보사이트에 입력해주세요!!</p>";
		Mail mail = Mail.builder().sender("4982@4982.com").receiver(email).title("4982 이메일 인증입니다").content(text)
				.build();
		mailUtil.sendMail(mail);
		return "인증번호가 발송되었습니다. 이메일을 확인하십시오";
	}

}
