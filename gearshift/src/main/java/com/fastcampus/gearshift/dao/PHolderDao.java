package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.UserDto;

public interface PHolderDao {
    int update(UserDto userDto) throws Exception;

    UserDto select(Integer userId) throws Exception;
}
