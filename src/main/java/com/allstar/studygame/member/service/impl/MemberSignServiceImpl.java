package com.allstar.studygame.member.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.member.dao.MemberDAO;
import com.allstar.studygame.member.service.MemberSignService;

@Service("memberSignService")
public class MemberSignServiceImpl implements MemberSignService{

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public boolean isIdDuplicate(String id) {
		//count 함수로 0 or 1 받아온다
		int checkResult = dao.selectMemberId(id);
		
		return checkResult== 0 ? true : false;
	}

	@Override
	public boolean isNicknameDuplicate(String nickname) {
		//count 함수로 0 or 1 받아온다
		int checkResult = dao.selectMemberNickName(nickname);
				
		return checkResult== 0 ? true : false;
	}

	@Override
	public void inputMember(Map map) {
		
		dao.insertMember(map);
	}

}
