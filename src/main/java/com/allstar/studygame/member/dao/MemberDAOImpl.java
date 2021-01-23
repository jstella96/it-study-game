package com.allstar.studygame.member.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.member.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper; 
	
	@Override
	public void insertMember(Map map) {
		
		sqlMapper.insert("insertMember",map);
	}

	@Override
	public void updateMember(Map map) {
		
		sqlMapper.update("updateMember",map);
	}

	@Override
	public void deleteMember(String id) {
		
		sqlMapper.update("deleteMember",id);
	}

	@Override
	public MemberDTO selectMember(String id) {
		
		return sqlMapper.selectOne("selectMember",id);
	}

	@Override
	public int selectMemberId(String id) {
		
		return sqlMapper.selectOne("selectMemberId",id);
	}

	@Override
	public int selectMemberNickName(String nickname) {
		
		return sqlMapper.selectOne("selectMemberNickName",nickname);
	}

	@Override
	public int selectMemberLoginCheck(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectMemberLoginCheck",map);
	}

}
