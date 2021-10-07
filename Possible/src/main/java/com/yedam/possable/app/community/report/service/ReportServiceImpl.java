package com.yedam.possable.app.community.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.report.domain.ReportVO;
import com.yedam.possable.app.community.report.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired ReportMapper reportMapper;
	
	@Override
	public List<ReportVO> getReportList(Criteria cri) {
		// TODO Auto-generated method stub
		return reportMapper.getReportList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return reportMapper.getTotalCount(cri);
	}

	@Override
	public ReportVO getReport(ReportVO vo) {
		// TODO Auto-generated method stub
		return reportMapper.getReport(vo);
	}
	
}
