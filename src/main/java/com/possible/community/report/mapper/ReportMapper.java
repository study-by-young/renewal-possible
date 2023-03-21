package com.possible.community.report.mapper;

import com.possible.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.report.domain.ReportVO;

import java.util.List;

public interface ReportMapper {

    //신고글 전체 목록
    public List<ReportVO> getReportList(Criteria cri);
    
    //전체 데이터 건수
  	public int getTotalCount(Criteria cri);
  	
  	//신고글 한건
  	public ReportVO getReport(ReportVO vo);
  	
  	public int insert(ReportVO vo);
  	
  	//이미 신고한 글 검증
  	public int reportCount(ReportVO vo);
    
}
