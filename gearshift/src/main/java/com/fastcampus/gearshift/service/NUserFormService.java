package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.NUserFormDto;

import java.util.List;

public interface NUserFormService {
    List<NUserFormDto> userForm();
    NUserFormDto getUserFormById(Integer userId);
    void updateUserForm(Integer userId, NUserFormDto updatedUserForm);
    void deleteUser(Integer userId);
}
