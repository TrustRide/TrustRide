package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.SAdminDao;
import com.fastcampus.gearshift.dto.AdminDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SAdminServiceImpl implements SAdminService {

    @Autowired
    private SAdminDao adminDao;

    @Override
    public void registerUser(AdminDto user) {
        adminDao.insertUser(user);
    }

    @Override
    public List<AdminDto> getAllUsers() {
        return adminDao.selectAllUsers();
    }

    @Override
    public int getTotalUserCount() {
        return adminDao.countAllUsers();
    }

    @Override
    public List<AdminDto> getUsersWithPaging(int offset, int limit) {
        return adminDao.selectUsersWithPaging(offset, limit);
    }

    @Override
    public AdminDto findUserByEmail(String email) {
        return adminDao.findByEmail(email);
    }

}
