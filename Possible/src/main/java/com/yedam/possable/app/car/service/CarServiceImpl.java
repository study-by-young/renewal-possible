package com.yedam.possable.app.car.service;

import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.domain.InsuranceOptionVO;
import com.yedam.possable.app.car.mapper.CarMapper;
import com.yedam.possable.app.company.domain.CompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
	public List<CarVO> getDistinctCarList() {
		return carMapper.getDistinctCarList();
	}

	@Override
	public List<CarVO> getCarByModel(String carModel) {
		return carMapper.getCarByModel(carModel);
	}

	@Override
	public CarVO viewCar(Long seq, Long cmpnSeq) {
		return carMapper.viewCar(seq, cmpnSeq);
	}
}
