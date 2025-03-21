package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.SUserDao;
import com.fastcampus.gearshift.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SUserServiceImpl implements SUserService {

    @Autowired
    private SUserDao userDao;

    @Override
    public void registerUser(UserDto user) {
        userDao.insertUser(user);
    }

    @Override
    public boolean isEmailDuplicated(String email) {
        return userDao.findByEmail(email) != null;
    }

    @Override
    public UserDto findUserByEmail(String email) {
        return userDao.findByEmail(email);
    }
}
