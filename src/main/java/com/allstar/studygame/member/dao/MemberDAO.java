package com.allstar.studygame.member.dao;

import java.util.Map;

import com.allstar.studygame.member.dto.MemberDTO;

public interface MemberDAO {
	

	 //List<MemberDTO> selectMemberList(Map map);
	
	 void insertMember(Map map);
	 void updateMember(Map map);
	 void deleteMember(String id);
	 MemberDTO selectMember(String id);
	 
	 int selectMemberLoginCheck(Map map);
	 int selectMemberId(String id);
	 int selectMemberNickName(String nickname);
}
