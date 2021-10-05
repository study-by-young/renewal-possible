package com.yedam.possable.app.community.qna.mapper;

import java.util.List;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.qna.domain.QnaVO;

public interface QnaMapper {

	public QnaVO read(QnaVO vo);
	
	public int insert(QnaVO vo);
	
	public int update(QnaVO vo);
	
	public int delete(QnaVO vo);
	
	public List<QnaVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
}
