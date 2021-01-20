package com.allstar.studygame.interview.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.interview.service.InterviewService;

@Service("interviewService")
public class InterviewServiceImpl implements InterviewService{
	
	@Resource(name="interviewDAO")
	private InterviewDAO dao;
}
