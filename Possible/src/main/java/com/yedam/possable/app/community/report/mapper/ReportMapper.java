package com.yedam.possable.app.community.report.mapper;

import java.util.List;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.report.domain.ReportVO;

public interface ReportMapper {

    //신고글 전체 목록
    public List<ReportVO> getReportList(Criteria cri);
    
    //전체 데이터 건수
  	public int getTotalCount(Criteria cri);
    
}
