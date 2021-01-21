package com.allstar.studygame.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.member.dao.MemberDAO;

@Service("memberLoginService")
public class MemberLoginServiceImpl implements MemberLoginService{

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public boolean isMember(Map map) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
