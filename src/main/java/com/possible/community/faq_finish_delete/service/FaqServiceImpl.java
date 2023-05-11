package com.possible.community.faq_finish_delete.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.faq_finish_delete.domain.FaqVO;
import com.possible.community.faq_finish_delete.mapper.FaqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	FaqMapper faqMapper;
	
	@Override
	public FaqVO read(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqMapper.read(vo);
	}

	@Override
	public int insert(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqMapper.insert(vo);
	}

	@Override
	public int update(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqMapper.update(vo);
	}

	@Override
	public int delete(Long seq) {
		// TODO Auto-generated method stub
		return faqMapper.delete(seq);
	}

	@Override
	public List<FaqVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return faqMapper.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return faqMapper.getTotalCount(cri);
	}

	@Override
	public List<FaqVO> getCategoryList(Criteria cri, String category) {
		// TODO Auto-generated method stub
		return faqMapper.getCategoryList(cri, category);
	}

	

}
