package com.allstar.studygame.member.service;

import java.util.Map;

public interface MemberSignService {
	
	//아이디 중복체크
	boolean	isIdDuplicate (String id);
	//닉네임 중복체크
	boolean	isNicknameDuplicate (String nickname);
	//회원가입
	void inputMember (Map map);	

}
