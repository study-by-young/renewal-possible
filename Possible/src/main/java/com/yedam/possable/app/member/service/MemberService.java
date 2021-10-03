package com.yedam.possable.app.member.service;

import java.util.List;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.member.domain.MemberVO;

public interface MemberService {
		//회원 전체 목록
		public List<MemberVO> memberList(Criteria cri); 
		
		//전체 데이터 건수
		public int getTotalCount(Criteria cri);
		
		//회원 한건조회
		public MemberVO memberOneSelect(MemberVO vo); 
		
		//회원 등록
		public int memberInsert(MemberVO vo);
		
		//회원 삭제
		public int memberDelete(MemberVO vo);
		
		//회원 수정
		public int memberUpdate(MemberVO vo);
		
		//아이디 중복 체크
		public int idChk(MemberVO vo);
		
		//아이디 찾기
		public String idFind(MemberVO vo);
		
		//비밀번호 찾기
		public int passFindUpdate(MemberVO vo);
		
		//카카오 로그인 체크
		public int kakaoIdCheck(MemberVO vo);
		//로그인
		public MemberVO getUserById(String id);
}
