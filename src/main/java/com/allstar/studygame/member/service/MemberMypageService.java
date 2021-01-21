package com.allstar.studygame.member.service;

import java.util.Map;

public interface MemberMypageService {

		//회원정보 수정
		void modifyMember (Map map);
		//회원정보 삭제
		void deleteMember (Map map);

}
