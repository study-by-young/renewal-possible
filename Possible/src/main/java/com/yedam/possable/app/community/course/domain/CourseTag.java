package com.yedam.possable.app.community.course.domain;

import lombok.Data;

@Data
public class CourseTag {
    private Long seq;
    private String name;

    private CourseBoardVO courseBoardVO;
}
