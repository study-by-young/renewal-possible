package com.yedam.possable.app.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private Long seq;
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String email;
	private String phone;
	private String addrCode;
	private String addrBasic;
	private String addrDetail;
	private String author;
	private String status;
	private Date genDate;
	private Date uptDate;
}
