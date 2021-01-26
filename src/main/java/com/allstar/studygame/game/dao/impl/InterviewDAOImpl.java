package com.allstar.studygame.game.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.game.dao.InterviewDAO;
import com.allstar.studygame.game.dto.InterviewDTO;


@Repository("interviewDAO")
public class InterviewDAOImpl implements InterviewDAO  {
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<InterviewDTO> selectInterviewQuizList(Map map) {
		
		return sqlMapper.selectList("selectInterviewQuizList",map);
	}

	@Override
	public void insertInterviewMark(Map map) {
		
		sqlMapper.insert("insertInterviewMark",map);
	}

	@Override
	public void updateInterviewMark(Map map) {
		sqlMapper.update("updateInterviewMark",map);
	}

	@Override
	public void deleteInterviewMark(Map map) {
		sqlMapper.delete("deleteInterviewMark",map);
	}

	@Override
	public List<Map> selectInterviewMarkList(String id) {
		sqlMapper.selectList("selectInterviewMarkList",id);
		return null;
	}
	
	
}
