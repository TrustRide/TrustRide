package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.PCateDao;
import com.fastcampus.gearshift.dto.CategoryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PCateServiceImpl implements PCateService {
    @Autowired
    private PCateDao cateDao;


    @Override
    public List<CategoryDto> cateList() {
        return cateDao.cateList();
    }
}
