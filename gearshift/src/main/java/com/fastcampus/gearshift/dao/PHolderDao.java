package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.UserDto;

import java.util.List;

public interface PHolderDao {
    int update(UserDto userDto) throws Exception;

    UserDto select(Integer userId) throws Exception;

    //차량 조회
    List<CarDto> carselect();

    //차량 상세 조회
    CarDto carSelect(Integer carInfoId) throws Exception;

    //유저 상세 조회
    UserDto userSelect(Integer userId) throws Exception;


}
