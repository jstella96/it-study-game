package com.allstar.studygame.quizplus.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.quizplus.dao.QuizPlusDAO;

@Service("quizPlusService")
public class QuizPlusServiceImpl implements QuizPlusService{
	
	@Resource(name="quizPlusDAO")
	private QuizPlusDAO dao;

	@Override
	public List<Map> getQuizs(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map getQuiz(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void inputQuiz(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyQuiz(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQuiz(Map map) {
		// TODO Auto-generated method stub
		
	}
}		
	