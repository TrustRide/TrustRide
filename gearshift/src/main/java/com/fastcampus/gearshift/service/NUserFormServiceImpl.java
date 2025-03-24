package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.NUserFormDao;
import com.fastcampus.gearshift.dto.NUserFormDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NUserFormServiceImpl implements NUserFormService {

    @Autowired
    private NUserFormDao userFormDao;

    @Override
    public List<NUserFormDto> userForm() {
        return userFormDao.userForm();
    }

    @Override
    public NUserFormDto getUserFormById(Integer userId) {
        return userFormDao.getUserFormById(userId);
    }

    @Override
    public void updateUserForm(Integer userId, NUserFormDto updatedUserForm) {
        userFormDao.updateUserForm(updatedUserForm);
    }

    @Override
    public void deleteUser(Integer userId) {
        userFormDao.deleteUser(userId);
    }
}
