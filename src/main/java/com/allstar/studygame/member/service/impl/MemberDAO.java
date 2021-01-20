package com.allstar.studygame.member.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.member.service.MemberService;
@Repository("memberDAO")
public class MemberDAO implements MemberService {
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;
	
}
