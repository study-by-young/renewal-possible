package com.yedam.possable.app.company.service;

import java.util.HashMap;
import java.util.List;

import com.yedam.possable.app.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.mapper.CompanyMapper;
import com.yedam.possable.app.member.service.MemberService;
@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired	CompanyMapper companyMapper;
	@Autowired MemberService memberService;

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

	@Override
	public int companyReg(CompanyVO vo) {
		// TODO Auto-generated method stub
		return companyMapper.companyReg(vo);
	}

    @Override
    public CompanyVO getCompanyByMemSeq(MemberVO vo) {
        return companyMapper.getCompanyByMemSeq(vo);
    }

    @Override
    public List<String> getCompanyItems(CompanyVO vo) {
        return companyMapper.getCompanyItems(vo);
    }

	@Override
	public HashMap<String, Object> companyIncome() {
		return companyMapper.companyIncome();
	}

	@Override
	public int companyInfoUpdate(CompanyVO vo) {
		// TODO Auto-generated method stub
		return companyMapper.companyInfoUpdate(vo);
	}
}

