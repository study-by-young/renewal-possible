package com.possible.board.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.faq_finish_delete.domain.FaqVO;
import com.possible.community.faq_finish_delete.mapper.FaqMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class FaqService {

    private final FaqMapper faqMapper;

    public FaqVO read(FaqVO vo) {
        // TODO Auto-generated method stub
        return faqMapper.read(vo);
    }

    public int insert(FaqVO vo) {
        // TODO Auto-generated method stub
        return faqMapper.insert(vo);
    }

    public int update(FaqVO vo) {
        // TODO Auto-generated method stub
        return faqMapper.update(vo);
    }

    public int delete(Long seq) {
        // TODO Auto-generated method stub
        return faqMapper.delete(seq);
    }

    public List<FaqVO> getList(Criteria cri) {
        // TODO Auto-generated method stub
        return faqMapper.getList(cri);
    }

    public int getTotalCount(Criteria cri) {
        // TODO Auto-generated method stub
        return faqMapper.getTotalCount(cri);
    }

    public List<FaqVO> getCategoryList(Criteria cri, String category) {
        // TODO Auto-generated method stub
        return faqMapper.getCategoryList(cri, category);
    }



}
