package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.CarInfoDto;
import com.fastcampus.gearshift.dto.CarListDto;
import com.fastcampus.gearshift.dto.UserDto;

import java.util.List;

public interface PHolderDao {


    UserDto select(Integer userId) throws Exception;

    //차량 조회
    List<CarListDto> carselect();

    //차량 상세 조회
    CarInfoDto carSelect(Integer carInfoId) throws Exception;

    //유저 상세 조회
    UserDto userSelect(Integer userId) throws Exception;

    //메인화면 검색
    List<CarListDto> searchCarsByTitle(String title) throws Exception;

    List<CarListDto> carselect(int offset, int pageSize);


     int getCarCount();

    List<CarListDto> carselectByCate(String cateCode, int offset, int pageSize);

    int getCarCountByCate(String cateCode);

}
