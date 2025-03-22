package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.UserDto;

public interface PHolderService {

    int modify(UserDto userDto) throws Exception;

    UserDto read(Integer userId) throws Exception;


}
