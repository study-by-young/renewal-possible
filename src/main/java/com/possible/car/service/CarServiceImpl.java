package com.possible.car.service;

import com.possible.car.domain.CarOptionVO;
import com.possible.car.domain.CarVO;
import com.possible.car.domain.InsuranceOptionVO;
import com.possible.car.mapper.CarMapper;
import com.possible.common.criteria.domain.Criteria;
import com.possible.company.domain.CompanyVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CarServiceImpl implements CarService {
    /*
     * 차량 상태 코드
     * CST01 : 대기, CST02 : 예약, CST03 : 사용, CST04 : 수리, CST05 : 비활성
     *
     */

    private final CarMapper carMapper;


	/**
	 * 차량 등록
	 * @param
	 * @throws Exception
	 */
	public void createCar() throws Exception {
		carMapper.createCar();
	}

	/**
	 * 차량 정보 수정
	 * @param
	 * @throws Exception
	 */
	public void updateCar() throws Exception {
		carMapper.updateCar();
	}

	/**
	 * 차량 상태 변경
	 * @param
	 * @throws Exception
	 */
	public void updateCarStatus() throws Exception {
		carMapper.updateCarStatus();
	}

	/**
	 * 차량 가격 변경
	 * @param
	 * @throws Exception
	 */
	public void updateCarPrice() throws Exception {
		carMapper.updateCarPrice();
	}

	/**
	 * 차량 삭제
	 * @param
	 * @throws Exception
	 */
	public void deleteCar() throws Exception {
		carMapper.deleteCar();
	}







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
    public int updateCompanyCar(CarVO carVO) {
        return carMapper.updateCompanyCar(carVO);
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
    public List<CarVO> getCarByModelAndCmpnSeq(CarVO vo) {
        return carMapper.getCarByModelAndCmpnSeq(vo);
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

	@Override
	public int updateCarPrice(CarVO vo) {
		// TODO Auto-generated method stub
		return carMapper.updateCarPrice(vo);
	}

	@Override
	public int comTotalCount(@Param("cri") Criteria cri, @Param("cmpnSeq")Long cmpnSeq) {
		// TODO Auto-generated method stub
		return carMapper.comTotalCount(cri, cmpnSeq);
	}

	@Override
	public List<CarVO> getCompanyCriList(@Param("cri") Criteria cri, @Param("cmpnSeq")Long cmpnSeq) {
		// TODO Auto-generated method stub
		return carMapper.getCompanyCriList(cri, cmpnSeq);
	}
}
