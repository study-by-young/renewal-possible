package com.yedam.possable.app.community.course.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CourseBoardCmtVO {
	private Long seq;
	private String content;
	private String writer;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date genDate;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date uptDate;
	private Long courseSeq;

	private CourseBoardVO board;
}
