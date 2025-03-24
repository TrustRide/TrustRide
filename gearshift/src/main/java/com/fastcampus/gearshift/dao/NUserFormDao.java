package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.NUserFormDto;

import java.util.List;

public interface NUserFormDao {
    List<NUserFormDto> userForm();
    NUserFormDto getUserFormById(Integer userId); // 사용자 정보 조회
    void updateUserForm(NUserFormDto updatedUserForm); // 사용자 정보 수정
    void deleteUser(Integer userId); // 사용자 탈퇴
}
