package com.allstar.studygame.member.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allstar.studygame.member.service.MemberSignService;

@Controller
public class memberController {
	
	@Resource(name = "memberSignService")
	private MemberSignService memberSignService;
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/sign", method = RequestMethod.GET)
	public String signGet() {
		return "/Main/Sign";
	}//sign()
	
	//회원가입 처리
	@RequestMapping(value = "/sign", method = RequestMethod.POST)
	public String signPost() {
		return "/Main/Sign";
	}/////sign()
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		return "/Main/Home";
	}//login()
	
	//로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost() {
		return "/Main/Home";
	}//login()

	/*sign.jsp로부터 id와 nickname값을 받아와 중복체크를 해준다.*/
	@RequestMapping(value="/sign/ajax",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String duplicateCheckAjax(@RequestParam Map map) {
		//1]서비스 호출
		boolean result =false;
		
		if(map.get("id") != null) {
			result=memberSignService.isIdDuplicate(map.get("id").toString());
		}else if(map.get("nickname") != null) {
			result=memberSignService.isNicknameDuplicate(map.get("nickname").toString());
		}
		
		return result?"available":"unavailable";
	}//duplicateCheckAjax()

}
