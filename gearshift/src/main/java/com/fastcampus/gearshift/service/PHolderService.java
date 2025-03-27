package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.CarInfoDto;
import com.fastcampus.gearshift.dto.CarListDto;
import com.fastcampus.gearshift.dto.UserDto;

import java.util.List;

public interface PHolderService {
    UserDto read(Integer userId) throws Exception;

    //차량 리스트 조회
    List<CarListDto> carselect();

    CarInfoDto carSelect(Integer carInfoId) throws Exception;

    UserDto userSelect(Integer userId) throws Exception;

    List<CarListDto> searchCarsByTitle(String title) throws Exception;

    List<CarListDto> carselect(int page, int pageSize) throws Exception;

    int getCarCount() throws Exception;

    List<CarListDto> carselectByCate(String cateCode, int page, int pageSize);

    int getCarCountByCate(String cateCode);
}
