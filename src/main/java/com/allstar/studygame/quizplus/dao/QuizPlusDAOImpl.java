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
		
		return sqlMapper.selectList("selectQuizList",map);
	}

	@Override
	public Map selectQuiz(Map map) {
		
		return sqlMapper.selectOne("selectQuiz",map);
	}

	@Override
	public void insertQuiz(Map map) {
		
		sqlMapper.insert("insertQuiz",map);
	}

	@Override
	public void updateQuiz(Map map) {
		
		sqlMapper.update("updateQuiz",map);
	}

	@Override
	public void deleteQuiz(Map map) {
		
		sqlMapper.delete("deleteQuiz",map);
	}

}
