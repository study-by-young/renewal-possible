package com.possible.community.notice.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.notice.domain.NoticeFileVO;
import com.possible.community.notice.domain.NoticeVO;
import com.possible.community.notice.mapper.NoticeFileMapper;
import com.possible.community.notice.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;
	@Autowired
	NoticeFileMapper noticeFileMapper;
	
	@Override
	public NoticeVO read(NoticeVO vo) {
		// TODO Auto-generated method stub
		vo = noticeMapper.read(vo);
		vo.setAttachList(noticeFileMapper.findBySeq(vo.getSeq()));
		return vo;
	}

	@Override
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

	@Override
	public int update(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeMapper.update(vo);
	}

	@Override
	public int delete(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeMapper.delete(vo);
	}

	@Override
	public boolean plusViews(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeMapper.plusViews(vo);
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return noticeMapper.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return noticeMapper.getTotalCount(cri);
	}

	@Override
	public NoticeFileVO attachRead(String name) {
		// TODO Auto-generated method stub
		return noticeFileMapper.attachRead(name);
	}

	@Override
	public Long readSeq() {
		// TODO Auto-generated method stub
		return noticeMapper.readSeq();
	}
	
}
