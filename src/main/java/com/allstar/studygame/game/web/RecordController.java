package com.allstar.studygame.game.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		List<Map> avgTypingSpeedList =  longWordService.getAvgTypingSpeedList(id);
		System.out.println(avgTypingSpeedList.size());
		for(Map typingMap : avgTypingSpeedList){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM월 dd일"); 
		String typingDate =  simpleDateFormat.format(typingMap.get("typing_date"));
		typingMap.put("typing_date",typingDate);
		}
		model.addAttribute("avgTypingSpeedList",avgTypingSpeedList);
		
		return "Record/Record.game";
		
	}//moveLongWordpage()
}
