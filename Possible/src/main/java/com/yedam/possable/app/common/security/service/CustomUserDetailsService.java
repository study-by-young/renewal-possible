package com.yedam.possable.app.common.security.service;

import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberService memberService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
			MemberVO user = memberService.getUserById(username);
			if(user == null) {
				 throw new UsernameNotFoundException("username " + username + " not found");
			}
			System.out.println("**************Found user***************");
			return user;
	}

}
