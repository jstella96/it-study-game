package com.allstar.studygame.game.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allstar.studygame.game.service.InterviewService;

@Controller
@RequestMapping("/interview/")
public class InterviewController {

	@Resource(name="interviewService")
	private InterviewService interviewService;

	
	//인텨뷰페이지 이동
	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String moveInterviewpage() {
		
		return "Game/Interview.game";
	}
}
