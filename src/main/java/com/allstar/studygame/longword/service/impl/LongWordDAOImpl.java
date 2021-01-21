package com.allstar.studygame.longword.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.longword.service.LongWordService;

@Repository("longWordDAO")
public class LongWordDAOImpl implements LongWordDAO{
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;
}
