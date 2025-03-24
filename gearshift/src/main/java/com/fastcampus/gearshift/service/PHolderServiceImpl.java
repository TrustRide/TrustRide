package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.PHolderDao;
import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PHolderServiceImpl implements PHolderService{
    @Autowired
    PHolderDao pHolderDao;


    @Override
    public int modify(UserDto userDto) throws Exception {
        return pHolderDao.update(userDto);
    }

    @Override
    public UserDto read(Integer userId) throws Exception {
       UserDto userDto = pHolderDao.select(userId);
       return userDto;
    }

    //차량 리스트 조회
    @Override
    public List<CarDto> carselect() {
        return pHolderDao.carselect();
    }

    @Override
    public CarDto carSelect(Integer carInfoId) throws Exception {
        CarDto carDto = pHolderDao.carSelect(carInfoId);
        return carDto;
    }

    @Override
    public UserDto userSelect(Integer userId) throws Exception {
        UserDto userDto =pHolderDao.userSelect(userId);
        return userDto;
    }


}
