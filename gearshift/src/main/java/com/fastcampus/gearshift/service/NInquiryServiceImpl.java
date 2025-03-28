package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.NInquiryDao;
import com.fastcampus.gearshift.dto.NInquiryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NInquiryServiceImpl implements NInquiryService {

    @Autowired
    private NInquiryDao nInquiryDao;

    @Override
    public List<NInquiryDto> getAll() {
        return nInquiryDao.findAll();
    }

    @Override
    public NInquiryDto getById(Integer inquiryId) {
        return nInquiryDao.findById(inquiryId);
    }

    @Override
    public void create(NInquiryDto dto) {
        System.out.println("NInquiryDto 서비스 = " + dto);
        nInquiryDao.insert(dto);
    }

    @Override
    public void update(NInquiryDto dto) {
        nInquiryDao.update(dto);
    }

    @Override
    public void delete(Integer inquiryId) {
        nInquiryDao.delete(inquiryId);
    }
}
