package com.allstar.studygame.longword.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.longword.service.LongWordService;

@Service("longWordService")
public class LongWordServiceImpl implements LongWordService {
	
	@Resource(name="longWordDAO")
	private LongWordDAO dao;
}
