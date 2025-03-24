package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.UserDto;

import java.util.List;

public interface PHolderService {

    int modify(UserDto userDto) throws Exception;

    UserDto read(Integer userId) throws Exception;

    //차량 리스트
    List<CarDto> carselect();

    //차량 상세 조회
    CarDto carSelect(Integer carInfoId) throws Exception;

    //유저 상세 조회
    UserDto userSelect(Integer userId) throws Exception;



}
