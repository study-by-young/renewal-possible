package com.possible.board.mapper;

import com.possible.board.domain.entity.Qna;
import com.possible.board.domain.entity.QnaAnswer;
import com.possible.common.criteria.domain.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface QnaMapper {

    Qna read(Qna vo);

    public int insert(Qna vo);

    public int update(Qna vo);

    public int delete(Qna vo);

    public List<Qna> getList(Criteria cri);

    public int getTotalCount(Criteria cri);

    // 답변 수 업데이트, 파라미터가 두개일 시 @Param으로 이름을 지정해준다.
    public void updateAnswerCnt(@Param("seq") Long seq, @Param("amount") Long amount);

    //마이페이지 문의 조회
    public List<Qna> getMyQna(Long memSeq);



    /* 응답 */
    public int insert(QnaAnswer vo);

    public int update(QnaAnswer vo);

    public int delete(QnaAnswer vo);

    public QnaAnswer read(QnaAnswer vo);

    public List<QnaAnswer> getList(Long qnaSeq);

    // 해당 게시글의 답변 수(답변이 1이면 답변완료, 0이면 미답변)
    public int getCountBySeq(Long qnaSeq);

}
