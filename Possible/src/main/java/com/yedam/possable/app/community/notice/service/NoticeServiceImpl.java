package com.yedam.possable.app.community.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.community.notice.domain.NoticeVO;
import com.yedam.possable.app.community.notice.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;
	
	@Override
	public NoticeVO read(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeMapper.read(vo);
	}

	@Override
	public int insert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeMapper.insert(vo);
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

	

}
