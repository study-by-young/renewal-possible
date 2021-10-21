package com.yedam.possable.app.common.security.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component("LoginSuccess")
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        log.info("=======================");
        log.info("login handler 실행");
        List<String> roleNames = new ArrayList<String>();

        authentication.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });  //전체 권한

        HttpSession session = request.getSession();
        session.setAttribute("member", authentication.getPrincipal());
        log.info(authentication.getPrincipal().toString());

        String path = request.getContextPath();
        if (roleNames.contains("ROLE_ADMIN")) {
            response.sendRedirect(path + "/admin/dashboard");
        } else if (roleNames.contains("ROLE_USER")) {
            response.sendRedirect(path + "/");
        } else {
            response.sendRedirect(path + "/");
        }
    }
}
