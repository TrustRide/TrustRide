package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.NInquiryDto;

import java.util.List;

public interface NInquiryDao {
    List<NInquiryDto> findAll();

    NInquiryDto findById(Integer inquiryId);

    int insert(NInquiryDto dto);

    int update(NInquiryDto dto);

    int delete(Integer inquiryId);
}
