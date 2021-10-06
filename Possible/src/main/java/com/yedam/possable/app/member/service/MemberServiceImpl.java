package com.yedam.possable.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
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

	@Override
	public String idFind(MemberVO vo) {
		// TODO 회원 아이디 찾기
		return memberMapper.idFind(vo);
	}

	@Override
	public int passFindUpdate(MemberVO vo) {
		// TODO 회원 비밀번호 찾기 변경

		String endcodePassword = bcryptPasswordEncoder.encode(vo.getPassword());
		System.out.println("비밀번호 찾기 변경 암호화 후 " + endcodePassword);

		vo.setPassword(endcodePassword);
		return memberMapper.passFindUpdate(vo);
	}

	@Override
	public int kakaoIdCheck(MemberVO vo) {
		// TODO 카카오 로그인 체크
		return memberMapper.kakaoIdCheck(vo);
	}

	@Override
	public MemberVO getUserById(String id) {
		// TODO 로그인
		return memberMapper.getUserById(id);
	}

	@Override
	public int kakaoInsert(MemberVO vo) {
		// TODO 카카오 추가 회원가입
		System.out.println("임시 비밀번호 변경 전");
		String endcodePassword = bcryptPasswordEncoder.encode(vo.getPassword());
		System.out.println("비밀번호 찾기 변경 암호화 후 " + endcodePassword);

		vo.setPassword(endcodePassword);
		return memberMapper.kakaoInsert(vo);
	}

	@Override
	public int authorUpdate(MemberVO vo) {
		// TODO 회원 권한 변경
		return memberMapper.authorUpdate(vo);
	}

	@Override
	public int memberPassUpdate(MemberVO vo) {
		// TODO	회원 내정보 수정 비밀번호
		String endcodePassword = bcryptPasswordEncoder.encode(vo.getPassword());//암호화

		vo.setPassword(endcodePassword);
		return memberMapper.memberPassUpdate(vo);
	}

	@Override
	public int memberInfoUpdate(MemberVO vo) {
		// TODO 회원 내정보 수정(휴대폰번호,이메일,주소)
		return memberMapper.memberInfoUpdate(vo);
	}




}
