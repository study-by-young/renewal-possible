package com.yedam.possable.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.mapper.MemberMapper;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; //BCry 암호화
	
	@Override
	public List<MemberVO> memberList(Criteria cri) {
		// TODO 회원 전체 리스트
		return memberMapper.memberList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return memberMapper.getTotalCount(cri);
	}

	@Override
	public MemberVO memberOneSelect(MemberVO vo) {
		// TODO 회원 한건 조회 
		return memberMapper.memberOneSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		// TODO 회원 생성 (비밀번호 암호화 추가)
		
		System.out.println("암호화 전 " + vo.getPassword());
		String endcodePassword = bcryptPasswordEncoder.encode(vo.getPassword());
		System.out.println("암호화 후 " + endcodePassword);
		System.out.println("유저정보 " + vo);
		
		vo.setPassword(endcodePassword);

		return memberMapper.memberInsert(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		// TODO 회원 삭제
		return memberMapper.memberDelete(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO 회원 수정
		return memberMapper.memberUpdate(vo);
	}

	@Override
	public int idChk(MemberVO vo) {
		// TODO 회원 아이디 중복체크
		return memberMapper.idChk(vo);
	}

	

}
