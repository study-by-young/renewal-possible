package com.yedam.possable.app.company.mapper;

import java.util.HashMap;
import java.util.List;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.member.domain.MemberVO;

public interface CompanyMapper {
    //업체 전체 목록
    public List<CompanyVO> companyList(Criteria cri);

	//업체 미승인 목록
	public List<CompanyVO> companyRegList();

	//업체 한건
	public CompanyVO companyOneSelect(CompanyVO vo);

	//업체 조회
	public CompanyVO companySelect(Long cmpnSeq);
	
	//전체 데이터 건수
	public int getTotalCount(Criteria cri);

	//업체 승인 업데이트
	public int companyRegUpdate(CompanyVO vo);

	//업체 승인 거부
	public int companyRegDelete(CompanyVO vo);

	//업체 등록
	public int companyReg(CompanyVO vo);

	// 멤버 시퀀스로 입체 조회
    public CompanyVO getCompanyByMemSeq(MemberVO vo);

    // 업체 여행 상품 조회
    public List<String> getCompanyItems(CompanyVO vo);

    //업체정보수정
    public int companyInfoUpdate(CompanyVO vo);

    //수익차트
    public HashMap<String, Object> companyIncome();
}
