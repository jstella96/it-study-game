package com.allstar.studygame.member.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.allstar.studygame.member.dto.MemberDTO;
import com.allstar.studygame.member.service.MemberLoginService;
import com.allstar.studygame.member.service.MemberSignService;

@Controller
@RequestMapping("/")
public class MemberController {
	
	@Resource(name = "memberSignService")
	private MemberSignService memberSignService;
	
	@Resource(name = "memberLoginService")
	private MemberLoginService memberLoginService;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "sign", method = RequestMethod.GET)
	public String moveSignPage() {
		return "Main/Sign";
	}//signGet()
	
	//회원가입 처리
	@RequestMapping(value = "sign", method = RequestMethod.POST)
	public String signProcess(@RequestParam Map map) {
		memberSignService.inputMember(map);
		return "Main/Home";
	}/////signPost()
	
	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String moveLoginPage() {
		return "Main/Home";
	}//loginGet()
	
	//로그인 처리
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginProcess(@RequestParam Map map, Model model, HttpServletRequest req,RedirectAttributes attr) {
		//회원여부 체크
		boolean result = memberLoginService.isMember(map);
		//로그인 성공, 정보있다면, 저장 후 게임 메인 페이지로 이동 
		if(result){
			MemberDTO memberdto = memberLoginService.findMember(map.get("id").toString());
			req.getSession().setAttribute("memberId",memberdto.getId());
			req.getSession().setAttribute("memberNickname",memberdto.getNickname());
			req.getSession().setAttribute("memberProfileImg",memberdto.getProfileImg());
			return "Mypage/Mypage.game";
		}else {
			attr.addFlashAttribute("error","존재하지 않는 아이디 입니다.");
			return "redirect:/login";
		}
	}//loginPost()

	/*sign.jsp로부터 id와 nickname값을 받아와 중복체크를 해준다.*/
	@RequestMapping(value="sign/ajax",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String duplicateCheckAjax(@RequestParam Map map) {
		//1]서비스 호출
		boolean result =false;
		
		if(map.get("id") != null) {
			result=memberSignService.isIdDuplicate(map.get("id").toString());
		}else if(map.get("nickname")!= null) {
			result=memberSignService.isNicknameDuplicate(map.get("nickname").toString());
		}
		
		return result?"available":"unavailable";
	}//duplicateCheckAjax()

}
