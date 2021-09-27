package com.yedam.possable.app.member.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberVO {
	private Long seq;
	private String id;
	private String password;
	private String name;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date birth;
	private String email;
	private String phone;
	private String addrCode;
	private String addrBasic;
	private String addrDetail;
	private String author;
	private String status;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date genDate;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date uptDate;
}
