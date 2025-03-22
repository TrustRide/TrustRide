package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.PHolderDao;
import com.fastcampus.gearshift.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}
