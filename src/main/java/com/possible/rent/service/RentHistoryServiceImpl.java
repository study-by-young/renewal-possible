package com.possible.rent.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.rent.domain.RentHistoryVO;
import com.possible.rent.mapper.RentHistoryMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RentHistoryServiceImpl implements RentHistoryService {

	@Autowired
	RentHistoryMapper rentHistoryMapper;

	@Override
	public List<RentHistoryVO> getRentHistoryListByCmpnSeq(@Param("cri") Criteria cri, @Param("cmpnSeq")Long cmpnSeq) {
		return rentHistoryMapper.getRentHistoryListByCmpnSeq(cri, cmpnSeq);
	}

	@Override
	public RentHistoryVO getRentHistory(Long seq) {
		return rentHistoryMapper.getRentHistory(seq);
	}

	@Override
	public int getTotalCount() {
		return rentHistoryMapper.getTotalCount();
	}

	@Override
	public List<RentHistoryVO> getRentHistoryList() {
		return rentHistoryMapper.getRentHistoryList();
	}

	@Override
	public List<RentHistoryVO> getRentHistoryListForMyPage(@Param("cri") Criteria cri, @Param("seq")Long seq) {
		return rentHistoryMapper.getRentHistoryListForMyPage(cri, seq);
	}

	@Override
	public RentHistoryVO getRentHistoryForMypage(Long seq) {
		return rentHistoryMapper.getRentHistoryForMypage(seq);
	}

    @Override
    public int refundRentHistory(String merchantUid) {
        return rentHistoryMapper.refundRentHistory(merchantUid);
    }

    @Override
    public RentHistoryVO getRentHistoryByMUid(String merchantUid) {
        return rentHistoryMapper.getRentHistoryByMUid(merchantUid);
    }

    @Override
	public List<Map<String, Object>> getLatestCompanySales(Long cmpnSeq) {
		return rentHistoryMapper.getLatestCompanySales(cmpnSeq);
	}

	@Override
	public List<RentHistoryVO> getCompanyTodayCar(Long cmpnSeq) {
		// TODO Auto-generated method stub
		return rentHistoryMapper.getCompanyTodayCar(cmpnSeq);
	}

    @Override
    public int insertRentHistory(RentHistoryVO vo) {
        return rentHistoryMapper.insertRentHistory(vo);
    }

	@Override
	public int getTotalCount(@Param("cri") Criteria cri, @Param("cmpnSeq")Long cmpnSeq) {
		// TODO Auto-generated method stub
		return rentHistoryMapper.getTotalCount(cri, cmpnSeq);
	}



}
