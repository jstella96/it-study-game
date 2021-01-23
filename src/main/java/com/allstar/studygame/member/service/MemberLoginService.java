package com.allstar.studygame.member.service;

import java.util.Map;

import com.allstar.studygame.member.dto.MemberDTO;

public interface MemberLoginService {

	boolean isMember(Map map);
	
	MemberDTO findMember(String id);
}
