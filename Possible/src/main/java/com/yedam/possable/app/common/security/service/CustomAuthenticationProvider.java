package com.yedam.possable.app.common.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {
    @Autowired
    CustomUserDetailsService customUserDetailsService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String id = (String)authentication.getPrincipal();
        String password = (String)authentication.getCredentials();

        UserDetails user = customUserDetailsService.loadUserByUsername(id);

        if(!user.getPassword().equals(password)){
            throw new BadCredentialsException("miss match password");
        }
        if(!authentication.getAuthorities().containsAll(user.getAuthorities())){
            throw new BadCredentialsException("No authorities");
        }
        return new UsernamePasswordAuthenticationToken(id, password, user.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return false;
    }
}
