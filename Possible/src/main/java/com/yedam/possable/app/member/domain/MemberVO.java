package com.yedam.possable.app.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String email;
	private String phone;
	private String addr;
	private String author;
	private String status;
	private Date gen_date;
	private Date upt_date;
}
