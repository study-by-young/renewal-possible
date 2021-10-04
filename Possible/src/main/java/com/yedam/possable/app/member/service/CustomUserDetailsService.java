package com.yedam.possable.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.member.domain.MemberVO;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberService memberService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
			MemberVO memberVO = memberService.getUserById(username);
			if(memberVO == null) {
				 throw new UsernameNotFoundException("username " + username + " not found");
			}
			System.out.println("**************Found user***************");
			System.out.println("id : " + memberVO.getUsername());
			return memberVO;
		
	}

}
