package com.yedam.possable.app.car.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.domain.InsuranceOptionVO;
import com.yedam.possable.app.car.mapper.CarMapper;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.company.domain.CompanyVO;

@Service
public class CarServiceImpl implements CarService {
    /*
     * 차량 상태 코드
     * CST01 : 대기, CST02 : 예약, CST03 : 사용, CST04 : 수리, CST05 : 비활성
     *
     */

    @Autowired
    CarMapper carMapper;

    @Override
    public List<CarVO> getCarList() {
        return carMapper.getCarList();
    }

    @Override
    public CarVO getCar(CarVO vo) {
        return carMapper.getCar(vo);
    }

    @Override
    public List<CarOptionVO> getCarOptions(CarVO vo) {
        return carMapper.getCarOptions(vo);
    }

    @Override
    public List<InsuranceOptionVO> getCarInsurance(CarVO vo) {
        return carMapper.getCarInsurance(vo);
    }

    @Override
    public int updateStatus(CarVO vo) {
        return carMapper.updateStatus(vo);
    }

    @Override
    public List<CarVO> getCompanyCarList(CompanyVO vo) {
        return carMapper.getCompanyCarList(vo);
    }

    @Override
    public CarVO getCompanyCar(CarVO vo) {
        return carMapper.getCompanyCar(vo);
    }

    @Override
    public int deleteCompanyCar(CarVO vo) {
        return carMapper.deleteCompanyCar(vo);
    }

    @Override
    public int updateCompanyCar(CarVO carVO, CompanyVO cmpnVO) {
        return carMapper.updateCompanyCar(carVO, cmpnVO);
    }

	@Override
	public List<CarVO> getDistinctCarList(Criteria cri) {
		return carMapper.getDistinctCarList(cri);
	}

	@Override
	public List<CarVO> getCarByModel(CarVO vo) {
		return carMapper.getCarByModel(vo);
	}

	@Override
	public int insertCompanyCar(CarVO vo) {
		// TODO Auto-generated method stub
		return carMapper.insertCompanyCar(vo);
	}
	
	@Override
	public int insertCarOptions(CarOptionVO vo) {
		// TODO Auto-generated method stub
		return carMapper.insertCarOptions(vo);
	}

	@Override
	public int insertCarOptions(List<CarOptionVO> list, Long carSeq) {
		// TODO Auto-generated method stub
		for (CarOptionVO option : list) {
			option.setCarSeq(carSeq);
			carMapper.insertCarOptions(option);
		}
		return 0;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return carMapper.getTotalCount(cri);
	}

	@Override
    public List<CarVO> getCarList_map(Criteria cri) {
        return carMapper.getCarList_map(cri);
    }

    @Override
    public CarVO getCar_map(CarVO vo) {
        return carMapper.getCar_map(vo);
    }

    @Override
    public List<CarVO> getCompanyCarList_map(CompanyVO vo) {
        return carMapper.getCompanyCarList_map(vo);
    }

	@Override
	public int deleteOption(CarOptionVO vo) {
		// TODO Auto-generated method stub
		return carMapper.deleteOption(vo);
	}

	@Override
	public int deleteIns(InsuranceOptionVO vo) {
		// TODO Auto-generated method stub
		return carMapper.deleteIns(vo);
	}

	@Override
	public int updateCarOptions(CarOptionVO vo) {
		// TODO Auto-generated method stub
		return carMapper.updateCarOptions(vo);
	}
}
