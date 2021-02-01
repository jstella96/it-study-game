package com.allstar.studygame.game.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.game.dao.InterviewDAO;



@Repository("interviewDAO")
public class InterviewDAOImpl implements InterviewDAO  {
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> selectInterviewQuizList(Map map) {

		return sqlMapper.selectList("selectInterviewQuizList",map);
	}

	@Override
	public void insertInterviewMark(Map map) {
		
		sqlMapper.insert("insertInterviewMark",map);
	}


	@Override
	public void deleteInterviewMark(String quizNo){
		sqlMapper.delete("deleteInterviewMark",quizNo);
	}

	@Override
	public List<Map> selectInterviewMarkList(String id) {
		
		return sqlMapper.selectList("selectInterviewMarkList",id);
	}
	
	
}
