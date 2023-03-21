package com.possible.rent.domain;

import com.possible.community.course.domain.CourseBoardVO;
import com.possible.company.domain.CompanyVO;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;

@Data
public class RentReviewVO {
    private Long seq;
    private String title;
    private String content;
    private Long score;

    private RentHistoryVO rentHistoryVO;
    private MemberVO memberVO;
    private CourseBoardVO courseBoardVO;
    private CompanyVO companyVO;
    //private BrandCodeVO brandCodeVO;
    //private CodeSubVO segmentCodeVO;
    //private ModelCodeVO modelCodeVO;
    //private TrimCodeVO trimCodeVO;
    private Long cnt; // 일반렌트 차량 목록 조회 시 리뷰 개수 출력에 이용

    private String name;

    private Long historySeq;
    private Long memSeq;
    private Long courseSeq;
    private Long cmpnSeq;
}
