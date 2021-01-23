package com.allstar.studygame.member.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.member.dao.MemberDAO;
import com.allstar.studygame.member.service.MemberMypageService;

@Service("memberMypageService")
public class MemberMypageServiceImpl implements MemberMypageService {

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public void modifyMember(Map map) {
		dao.updateMember(map);
	}

	@Override
	public void deleteMember(String id) {
		dao.deleteMember(id);
	}

}
