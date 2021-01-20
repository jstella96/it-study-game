package com.allstar.studygame.shortword.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.shortword.service.ShortWordService;

@Service("shortWordService")
public class ShortWordServiceImpl implements ShortWordService {
	
	@Resource(name="shortWordDAO")
	private ShortWordDAO dao;
}
