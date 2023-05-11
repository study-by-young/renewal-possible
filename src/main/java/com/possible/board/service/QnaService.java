package com.possible.board.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.qna_finish_delete.mapper.QnaAnswerMapper;
import com.possible.community.qna_finish_delete.mapper.QnaMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class QnaService {

    private final QnaMapper qnaMapper;
    private final QnaAnswerMapper qnaAnswerMapper;


    public com.yedam.possable.app.community.qna.domain.QnaVO read(com.yedam.possable.app.community.qna.domain.QnaVO vo) {
        // TODO Auto-generated method stub
        return qnaMapper.read(vo);
    }

    public int insert(com.yedam.possable.app.community.qna.domain.QnaVO vo) {
        // TODO Auto-generated method stub
        return qnaMapper.insert(vo);
    }

    public int update(com.yedam.possable.app.community.qna.domain.QnaVO vo) {
        // TODO Auto-generated method stub
        return qnaMapper.update(vo);
    }

    public int delete(com.yedam.possable.app.community.qna.domain.QnaVO vo) {
        // TODO Auto-generated method stub
        return qnaMapper.delete(vo);
    }

    public List<com.yedam.possable.app.community.qna.domain.QnaVO> getList(Criteria cri) {
        // TODO Auto-generated method stub
        return qnaMapper.getList(cri);
    }

    public int getTotalCount(Criteria cri) {
        // TODO Auto-generated method stub
        return qnaMapper.getTotalCount(cri);
    }

    public List<com.yedam.possable.app.community.qna.domain.QnaVO> getMyQna(Long memSeq) {
        // TODO Auto-generated method stub
        return qnaMapper.getMyQna(memSeq);
    }

    /* 응답 */

    public int insert(com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        qnaMapper.updateAnswerCnt(vo.getQnaSeq(), 1L);
        return qnaAnswerMapper.insert(vo);
    }

    public int update(com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        return qnaAnswerMapper.update(vo);
    }

    public int delete(com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        qnaMapper.updateAnswerCnt(vo.getQnaSeq(), -1L);
        return qnaAnswerMapper.delete(vo);
    }

    public com.yedam.possable.app.community.qna.domain.QnaAnswerVO read(com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        return qnaAnswerMapper.read(vo);
    }

    public List<com.yedam.possable.app.community.qna.domain.QnaAnswerVO> getList(Long qnaSeq) {
        return qnaAnswerMapper.getList(qnaSeq);
    }


}
