package com.yedam.possable.app.member.Mapper;

import java.util.List;

import com.yedam.possable.app.member.domain.MemberVO;

public interface MemberMapper {
	//회원 전체 목록
	public List<MemberVO> memberList(); 
	
	//회원 한건조회
	public MemberVO memberOneSelect(); 
	
	//회원 등록
	public int memberInsert();
	
	//회원 삭제
	public int memberDelete();
	
	//회원 수정
	public int memberUpdate();
}
