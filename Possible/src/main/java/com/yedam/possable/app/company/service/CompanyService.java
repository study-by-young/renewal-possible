package com.yedam.possable.app.company.service;

import java.util.List;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.company.domain.CompanyVO;

public interface CompanyService {
	
		//업체 미승인 목록
		public List<CompanyVO> companyRegList();
		
		//업체 전체 목록
		public List<CompanyVO> companyList(Criteria cri);
		
		//업체 한건
		public CompanyVO companyOneSelect(CompanyVO vo); 
		
		//전체 데이터 건수
		public int getTotalCount(Criteria cri);
		
		//업체 승인 업데이트
		public int companyRegUpdate(CompanyVO vo);
		
		//업체 승인 거부
		public int companyRegDelete(CompanyVO vo);
		
}
