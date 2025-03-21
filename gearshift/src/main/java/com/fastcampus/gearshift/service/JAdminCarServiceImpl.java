package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.JAdminCarDao;
import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.ImageDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class JAdminCarServiceImpl implements JAdminCarService {

    private final JAdminCarDao carDao;

    // 차량 목록 조회
    @Override
    public List<CarDto> getCarList() {
        return carDao.getCarList();
    }

    // 차량 등록
    @Transactional
    @Override
    public void registerCar(CarDto carDto) {
        // (1) car_information INSERT
        carDao.insertCarInformation(carDto);

        // (2) information INSERT
        carDao.insertCarBasicInfo(carDto);

        // (3) 이미지 INSERT(반복)
        if (carDto.getImages() != null) {
            for (ImageDto image : carDto.getImages()) {
                image.setCarInfoId(carDto.getCarInfoId());
                carDao.insertCarImage(image);
            }
        }
    }

    // ================================
    //         추가된 부분
    // ================================

    // 차량 상세 조회
    @Override
    public CarDto getCarById(Integer carInfoId) {
        return carDao.getCarById(carInfoId);
    }

    // 차량 수정
    @Transactional
    @Override
    public void updateCar(CarDto carDto) {
        // 1) car_information UPDATE
        carDao.updateCarInformation(carDto);
        // 2) information UPDATE
        carDao.updateCarBasicInfo(carDto);
        // 3) 이미지 업데이트는 필요시 구현
        //    예: 일단 이전 이미지 DELETE 후 재삽입 등
    }

    // 차량 삭제
    @Transactional
    @Override
    public void deleteCar(Integer carInfoId) {

        System.out.println("carInfoId  서비스= " + carInfoId);
        carDao.deleteCar(carInfoId);  // 논리삭제(is_deleted를 true) 혹은 물리삭제
    }
}
