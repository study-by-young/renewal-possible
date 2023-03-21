package com.possible.community.report.service;

import com.possible.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.report.domain.ReportVO;

import java.util.List;

public interface ReportService {
	
	//신고글 전체 목록
    public List<ReportVO> getReportList(Criteria cri);
    
    //전체 데이터 건수
  	public int getTotalCount(Criteria cri);
  	
	//신고글 한건
  	public ReportVO getReport(ReportVO vo);
  	
  	public int insert(ReportVO vo);
  	
  	public int reportCount(ReportVO vo);
}
