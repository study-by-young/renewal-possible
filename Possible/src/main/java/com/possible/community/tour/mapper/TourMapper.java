package com.possible.community.tour.mapper;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.tour.domain.TestVO;

import java.util.List;

public interface TourMapper {

    public int insert(TestVO vo);

    public long maxDate();

    public List<TestVO> contentId();

    public int update(TestVO vo);

    public int delete(TestVO vo);

    public List<TestVO> getList(Criteria cri);
    
    public int getTotalCount(Criteria cri);

    public List<TestVO> getLatestList();
}
