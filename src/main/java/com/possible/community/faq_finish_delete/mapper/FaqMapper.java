package com.possible.community.faq_finish_delete.mapper;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.faq_finish_delete.domain.FaqVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FaqMapper {

	public FaqVO read(FaqVO vo);
	
	public int insert(FaqVO vo);
	
	public int update(FaqVO vo);
	
	public int delete(Long seq);
	
	public List<FaqVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<FaqVO> getCategoryList(@Param("cri") Criteria cri,@Param("category") String category);
}
