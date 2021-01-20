package com.allstar.studygame.shortword.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.shortword.service.ShortWordService;

@Repository("shortWordDAO")
public class ShortWordDAO implements ShortWordService{
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;
	
}
