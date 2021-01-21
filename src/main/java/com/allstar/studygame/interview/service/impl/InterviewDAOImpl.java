package com.allstar.studygame.interview.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.interview.service.InterviewService;

@Repository("interviewDAO")
public class InterviewDAOImpl implements InterviewDAO  {
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;
	
	
}
