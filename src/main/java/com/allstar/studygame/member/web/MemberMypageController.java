package com.allstar.studygame.member.web;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.allstar.studygame.member.dto.MemberDTO;
import com.allstar.studygame.member.service.MemberLoginService;
import com.allstar.studygame.member.service.MemberMypageService;

@Controller
@RequestMapping("/mypage/")
public class MemberMypageController {
		

	
		@Resource(name = "memberLoginService")
		private MemberLoginService memberLoginService;
		
	
		@Resource(name = "memberMypageService")
		private MemberMypageService memberMypageService;
		
		
		//마이페이지 이동
		@RequestMapping(value = "page", method = RequestMethod.GET)
		public String moveMypage(HttpServletRequest req, Model model) {
			MemberDTO memberDto = memberLoginService.findMember(req.getSession().getAttribute("memberId").toString());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
			model.addAttribute("signDate", simpleDateFormat.format(memberDto.getSignDate()));
			return "Mypage/Mypage.game";
		}//moveMypage()
		
		//회원수정페이지 이동 *moveMypage()와 중복 코딩이 되어버린다.
		@RequestMapping(value = "modify", method = RequestMethod.GET)
		public String moveModifyPage(HttpServletRequest req, Model model) {
			MemberDTO memberDto = memberLoginService.findMember(req.getSession().getAttribute("memberId").toString());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
			model.addAttribute("signDate", simpleDateFormat.format(memberDto.getSignDate()));
			return "Mypage/MypageModify.game";
		}//moveModifyPage()
		
		//회원수정프로세스 닉네임수정, 프로필사진수정 두가지 경우가 있다.
		@RequestMapping(value = "modify", method = RequestMethod.POST)
		public String MemberModifyProcess(@RequestParam Map map,HttpServletRequest req, Model model) {
			map.put("id",req.getSession().getAttribute("memberId").toString());
			model.addAttribute("signDate", map.get("signDate"));
			memberMypageService.modifyMember(map);
			if(map.get("nickname") != null) {
				req.getSession().setAttribute("memberNickname",map.get("nickname"));
				return "Mypage/Mypage.game";
			}else if(map.get("profileImg") != null) {
				req.getSession().setAttribute("memberProfileImg",map.get("profileImg"));
				return "Mypage/MypageModify.game";
			}
			return "Mypage/MypageModify.game";
		}//moveModifyPage()
		
		//회원가입 페이지 이동
		@RequestMapping(value = "withdraw", method = RequestMethod.GET)
		public String MemberModifyWithdraw() {
			return "Main/Home";
		}//signGet()
		
}
