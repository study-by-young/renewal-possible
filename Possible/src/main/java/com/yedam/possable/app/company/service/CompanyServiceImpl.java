package com.yedam.possable.app.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.mapper.CompanyMapper;
@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired	CompanyMapper companyMapper;
	
	@Override
	public List<CompanyVO> companyRegList() {
		// TODO Auto-generated method stub
		return companyMapper.companyRegList();
	}

	@Override
	public List<CompanyVO> companyList(Criteria cri) {
		// TODO Auto-generated method stub
		return companyMapper.companyList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return companyMapper.getTotalCount(cri);
	}

	@Override
	public int companyRegUpdate(CompanyVO vo) {
		// TODO Auto-generated method stub
		return companyMapper.companyRegUpdate(vo);
	}

	@Override
	public CompanyVO companyOneSelect(CompanyVO vo) {
		// TODO Auto-generated method stub
		return companyMapper.companyOneSelect(vo);
	}

	@Override
	public int companyRegDelete(CompanyVO vo) {
		// TODO Auto-generated method stub
		return companyMapper.companyRegDelete(vo);
	}

}
