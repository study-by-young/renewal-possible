package com.yedam.possable.app.community.course.domain;

import lombok.Data;

@Data
public class CourseVO {
	private Long courseSeq;
    private Long seq;
    private Long placeNo;
    private Long contentId;

    private CourseBoardVO courseBoardVO;
}
