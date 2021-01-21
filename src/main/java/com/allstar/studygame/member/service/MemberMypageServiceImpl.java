package com.allstar.studygame.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.member.dao.MemberDAO;

@Service("memberMypageService")
public class MemberMypageServiceImpl implements MemberMypageService {

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public void modifyMember(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(Map map) {
		// TODO Auto-generated method stub
		
	}

}
