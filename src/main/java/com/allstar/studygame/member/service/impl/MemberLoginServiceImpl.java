package com.allstar.studygame.member.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.member.dao.MemberDAO;
import com.allstar.studygame.member.dto.MemberDTO;
import com.allstar.studygame.member.service.MemberLoginService;

@Service("memberLoginService")
public class MemberLoginServiceImpl implements MemberLoginService{

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public boolean isMember(Map map) {
		//정보가 있으면 로그인 성공
		return dao.selectMemberLoginCheck(map) == 1 ? true : false;
	}

	@Override
	public MemberDTO findMember(String id) {
		//회원정보 반환
		return dao.selectMember(id);
	}
	
}
