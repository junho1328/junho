package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	// UDAO-1. 회원 정보 저장
	public int insert(Member member) {
		return tpl.insert("memberMapper.insert", member);
	}
	
	// UDAO-2. 아이디 찾기
	public String findUsernameByNameAndTel(String name, String tel) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("tel", tel);
		return tpl.selectOne("memberMapper.findUsernameByNameAndTel", map);
	}
		
	// UDAO-3. 비밀번호 변경
		public String changePwd(String name, String tel) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("tel", tel);
			return tpl.selectOne("memberMapper.changePwd", map);
		}
	// UDAO-5. 비밀번호 찾기
	public String findPasswordByIdAndEmail(String username, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("email", email);
		return tpl.selectOne("memberMapper.findPasswordByIdAndEmail", map);
	}

	// UDAO-6. 비밀번호 변경
	public int updatePassword(String username, String password) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("password", password);
		return tpl.update("memberMapper.updatePassword", map);
	}
	
	// UDAO-7. 아이디로 비밀번호 읽어오기
	public String findPasswordById(String username) {
		return tpl.selectOne("memberMapper.findPasswordById", username);
	}
	
	// UDAO-8. 회원 정보 읽기
	public Member findById(String username) {
		return tpl.selectOne("memberMapper.findById", username);
	}

	// UDAO-9. 이름 변경
	public int updateName(String username, String name) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("name", name);
		return tpl.update("memberMapper.updateIrum", map);
	}
	
	// UDAO-10.	회원 정보 변경
	public int update(Member member) {
		System.out.println(member);
		return tpl.update("memberMapper.update", member);
	}

	// UDAO-11.	회원 정보 가져오기(관리자 권한)
	public List<Member> findAllMember() {
		return tpl.selectList("memberMapper.findAllMember");
	}

	public int block(String username) {
		return tpl.update("memberMapper.updateBlock", username);
		
	}

	public int unBlock(String username) {
		return tpl.update("memberMapper.updateUnBlock", username);
		
	}

	public int selectBlock(String username) {
		return tpl.selectOne("memberMapper.findBlock");
	}

	public Member findMemberByUsername(String username) {
		return tpl.selectOne("memberMapper.findMemberByUsername", username);
	}
}
