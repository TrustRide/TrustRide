package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.JAdminCarDao;
import com.fastcampus.gearshift.dao.PCateDao;
import com.fastcampus.gearshift.dao.PHolderDao;
import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.CategoryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PCateServiceImpl implements PCateService {
    @Autowired
    private PCateDao cateDao;
    @Autowired
    private PHolderDao pHolderDao;


    @Override
    public List<CategoryDto> cateList() {
        return cateDao.cateList();
    }


}
