package com.possible.community.report.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.report.mapper.ReportMapper;
import com.yedam.possable.app.community.report.domain.ReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportMapper reportMapper;
	
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

	@Override
	public int insert(ReportVO vo) {
		// TODO Auto-generated method stub
		return reportMapper.insert(vo);
	}

	@Override
	public int reportCount(ReportVO vo) {
		// TODO Auto-generated method stub
		return reportMapper.reportCount(vo);
	}
	
}
