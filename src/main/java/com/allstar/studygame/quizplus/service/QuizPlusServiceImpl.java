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
		return dao.selectQuizList(map);
	}

	@Override
	public Map getQuiz(Map map) {
		// TODO Auto-generated method stub
		return dao.selectQuiz(map);
	}

	@Override
	public void inputQuiz(Map map) {
		dao.insertQuiz(map);
		
	}

	@Override
	public void modifyQuiz(Map map) {
		
		dao.updateQuiz(map);
	}

	@Override
	public void deleteQuiz(Map map) {
		dao.deleteQuiz(map);
	}
}		
	