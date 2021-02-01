package com.allstar.studygame.game.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allstar.studygame.game.service.LongWordService;


@Controller
@RequestMapping("/longword/")
public class LongWordController {
	
	@Resource(name="longWordService")
	private LongWordService longWordService;

	//1]긴글게임페이지 이동
	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String moveLongWordpage(@RequestParam Map map, Model model,HttpServletRequest req) {
		
		List<Map> quizList =longWordService.getQuizs(map);
		System.out.println(quizList.size());
		model.addAttribute("quizList",quizList);
		String targetTypingSpeed = longWordService.getTargetTypingSpeed(req.getSession().getAttribute("memberId").toString());
		model.addAttribute("targetTypingSpeed",targetTypingSpeed);
		return "Game/LongWord.game";
	}//moveLongWordpage()
	
	
	//2]게임이 끝난후 타이핑 속도를 입력
	@RequestMapping(value="typingSpeed/ajax",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String inputTypingSpeed(@RequestParam String typingSpeed,HttpServletRequest req) {
		
		Map typingMap = new HashMap();
		typingMap.put("typingSpeed",typingSpeed);
		typingMap.put("id",req.getSession().getAttribute("memberId").toString());
		longWordService.inputAvgTypingSpeed(typingMap);
		
		return "ok";
	}//inputTypingSpeedAjax()
	
}
