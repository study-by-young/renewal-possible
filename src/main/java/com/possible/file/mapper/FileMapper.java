package com.possible.file.mapper;

import com.possible.community.notice_finish_delete.domain.NoticeFileVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileMapper {

    // 공지사항 첨부파일

    public void insert(NoticeFileVO vo);

    public void delete(String name);

    public List<NoticeFileVO> findBySeq(Long noticeSeq);

    public void deleteAll(Long noticeSeq);

    public NoticeFileVO attachRead(String name);
}
