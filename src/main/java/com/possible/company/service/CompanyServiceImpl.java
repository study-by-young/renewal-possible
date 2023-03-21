package com.possible.company.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.company.domain.CompanyItemVO;
import com.possible.company.domain.CompanyVO;
import com.possible.company.mapper.CompanyMapper;
import com.possible.member.service.MemberService;
import com.yedam.possable.app.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
	CompanyMapper companyMapper;
	@Autowired
	MemberService memberService;

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
    public List<CompanyItemVO> getCompanyItems(CompanyVO vo) {
        return companyMapper.getCompanyItems(vo);
    }

	@Override
	public int companyInfoUpdate(CompanyVO vo) {
		// TODO Auto-generated method stub
		return companyMapper.companyInfoUpdate(vo);
	}

	@Override
	public int deleteCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		return companyMapper.deleteCompany(vo);
	}

	@Override
	public int insertCompanyItem(String code, Long cmpnSeq) {
		CompanyItemVO vo = new CompanyItemVO();
		vo.setOptCode(code);
		vo.setCmpnSeq(cmpnSeq);
		return companyMapper.insertCompanyItem(vo);
	}

	@Override
	public int deleteCompanyItems(Long seq) {
		return companyMapper.deleteCompanyItems(seq);
	}

	@Override
	public CompanyVO companySelect(Long cmpnSeq) {
		return companyMapper.companySelect(cmpnSeq);
	}

	@Override
	public List<String> getCompanyItemCodes(CompanyVO vo){
		return companyMapper.getCompanyItemCodes(vo);
	}
}

