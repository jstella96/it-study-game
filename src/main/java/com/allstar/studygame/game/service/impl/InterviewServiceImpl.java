package com.allstar.studygame.game.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.game.dao.InterviewDAO;
import com.allstar.studygame.game.dto.InterviewDTO;
import com.allstar.studygame.game.service.InterviewService;

@Service("interviewService")
public class InterviewServiceImpl implements InterviewService{
	
	@Resource(name="interviewDAO")
	private InterviewDAO dao;

	@Override
	public List<InterviewDTO> getQuizs(Map map) {
		// TODO Auto-generated method stub
		return dao.selectInterviewQuizList(map);
	}
}
