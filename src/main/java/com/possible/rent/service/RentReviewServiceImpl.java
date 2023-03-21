package com.possible.rent.service;

import com.possible.car.domain.CarVO;
import com.possible.rent.domain.RentReviewVO;
import com.possible.rent.mapper.RentReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentReviewServiceImpl implements RentReviewService {

	@Autowired
	RentReviewMapper rentReviewMapper;

    @Override
    public List<RentReviewVO> getLatestReviewList() {
        return rentReviewMapper.getLatestReviewList();
    }

    @Override
	public List<RentReviewVO> getReviewListByCmpnSeq(CarVO vo) {
		return rentReviewMapper.getReviewListByCmpnSeq(vo);
	}

	@Override
	public List<RentReviewVO> getRentReviewListByCompany(RentReviewVO vo) {
		return rentReviewMapper.getRentReviewListByCompany(vo);
	}

	@Override
	public List<RentReviewVO> getRentReviewListByMember(Long seq) {
		return rentReviewMapper.getRentReviewListByMember(seq);
	}

	@Override
	public RentReviewVO getRentReview(Long seq ) {
		return rentReviewMapper.getRentReview(seq);
	}

	@Override
	public int insertRentReview(RentReviewVO vo) {
		return rentReviewMapper.insertRentReview(vo);
	}

	@Override
	public int updateRentReview(RentReviewVO vo) {
		return rentReviewMapper.updateRentReview(vo);
	}

	@Override
	public int deleteRentReview(Long seq) {
		return rentReviewMapper.deleteRentReview(seq);
	}

	//업체관리자 리뷰조회
	@Override
	public List<RentReviewVO> getCompanyReivewList(Long cmpnSeq) {
		return rentReviewMapper.getCompanyReivewList(cmpnSeq);
	}

}
