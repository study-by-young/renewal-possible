package com.possible.board.mapper;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.notice_finish_delete.domain.NoticeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {


    public NoticeVO read(NoticeVO vo);

    public int insert(NoticeVO vo);

    public int update(NoticeVO vo);

    public int delete(NoticeVO vo);

    public boolean plusViews(NoticeVO vo);

    public List<NoticeVO> getList(Criteria cri);

    public int getTotalCount(Criteria cri);

    public Long readSeq();

}
