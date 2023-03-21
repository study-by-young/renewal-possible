package com.possible.community.qna.mapper;

import com.possible.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.qna.domain.QnaVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QnaMapper {

	public QnaVO read(QnaVO vo);
	
	public int insert(QnaVO vo);
	
	public int update(QnaVO vo);
	
	public int delete(QnaVO vo);
	
	public List<QnaVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	// 답변 수 업데이트, 파라미터가 두개일 시 @Param으로 이름을 지정해준다.
	public void updateAnswerCnt(@Param("seq") Long seq, @Param("amount") Long amount);
	
	//마이페이지 문의 조회
	public List<QnaVO> getMyQna(Long memSeq);
}
