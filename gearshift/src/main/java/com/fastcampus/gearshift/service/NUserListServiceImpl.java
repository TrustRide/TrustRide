package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.NUserListDao;
import com.fastcampus.gearshift.dto.NUserListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NUserListServiceImpl implements NUserListService {

    @Autowired
    private NUserListDao userListDao;

    @Override
    public List<NUserListDto> userList() {
        return userListDao.userList();
    }
}
