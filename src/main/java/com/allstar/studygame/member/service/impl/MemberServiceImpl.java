package com.allstar.studygame.member.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.member.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Resource(name="memberDAO")
	private MemberDAO dao;
}
