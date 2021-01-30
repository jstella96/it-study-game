package com.allstar.studygame.member.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	
	String id;
	String password;
	String nickname;
	java.sql.Date signDate;
	String profileImg;
	String targetTypingSpeed;
}
