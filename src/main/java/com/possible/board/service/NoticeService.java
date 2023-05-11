package com.possible.board.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.notice_finish_delete.domain.NoticeFileVO;
import com.possible.community.notice_finish_delete.domain.NoticeVO;
import com.possible.community.notice_finish_delete.mapper.NoticeFileMapper;
import com.possible.community.notice_finish_delete.mapper.NoticeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class NoticeService {

    private final NoticeMapper noticeMapper;
    private final NoticeFileMapper noticeFileMapper;

    /**
     * --
     *
     * @param vo
     * @return
     * @throws Exception
     */
    public NoticeVO read(NoticeVO vo) {
        // TODO Auto-generated method stub
        vo = noticeMapper.read(vo);
        vo.setAttachList(noticeFileMapper.findBySeq(vo.getSeq()));
        return vo;
    }

    public int insert(NoticeVO vo) {
        // TODO Auto-generated method stub
        noticeMapper.insert(vo);
        if(vo.getAttachList() == null) {
            return 1;
        } else {
            for(NoticeFileVO attach : vo.getAttachList()) {
                // attach.setSeq(vo.getSeq());
                attach.setNoticeSeq(vo.getSeq());
                noticeFileMapper.insert(attach);
            }
        }
        return 1;
    }

    public int update(NoticeVO vo) {
        // TODO Auto-generated method stub
        return noticeMapper.update(vo);
    }

    public int delete(NoticeVO vo) {
        // TODO Auto-generated method stub
        return noticeMapper.delete(vo);
    }

    public boolean plusViews(NoticeVO vo) {
        // TODO Auto-generated method stub
        return noticeMapper.plusViews(vo);
    }

    public List<NoticeVO> getList(Criteria cri) {
        // TODO Auto-generated method stub
        return noticeMapper.getList(cri);
    }

    public int getTotalCount(Criteria cri) {
        // TODO Auto-generated method stub
        return noticeMapper.getTotalCount(cri);
    }

    public NoticeFileVO attachRead(String name) {
        // TODO Auto-generated method stub
        return noticeFileMapper.attachRead(name);
    }

    public Long readSeq() {
        // TODO Auto-generated method stub
        return noticeMapper.readSeq();
    }

}
