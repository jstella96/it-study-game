package com.allstar.studygame.quizplus.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("quizPlusDAO")
public class QuizPlusDAOImpl implements QuizPlusDAO{

	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper; 
	
	@Override
	public List<Map> selectQuizList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map selectQuiz(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertQuiz(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateQuiz(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQuiz(Map map) {
		// TODO Auto-generated method stub
		
	}

}
