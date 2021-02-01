package com.allstar.studygame.game.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.allstar.studygame.game.service.InterviewService;
import com.allstar.studygame.game.service.LongWordService;

@Controller
@RequestMapping(value = "/record/")
public class RecordController {

	@Resource(name="longWordService")
	private LongWordService longWordService;
	
	@Resource(name="interviewService")
	private InterviewService interviewService;
	
	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String moveRecordpage(HttpServletRequest req,Model model) {
		
		String id = req.getSession().getAttribute("memberId").toString();
		//타이핑 속도그래프 리스트
		List<Map> avgTypingSpeedList =  longWordService.getAvgTypingSpeedList(id);
		model.addAttribute("avgTypingSpeedList",avgTypingSpeedList);
		//오답체크리스트
		List<Map> wrongQuizList = interviewService.getWrongQuizs(id);
		model.addAttribute("wrongQuizList",wrongQuizList );
		
		return "Record/Record.game";
		
	}//moveLongWordpage()
	
	@RequestMapping(value = "quiz/delete", method = RequestMethod.GET)
	public String quizdelete(@RequestParam String quizNo) {
		
		interviewService.deleteWrongQuiz(quizNo);
		
		return  "forward:/record/page";
		
	}//moveLongWordpage()
}
