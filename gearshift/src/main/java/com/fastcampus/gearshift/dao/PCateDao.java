package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.CarCateDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface PCateDao {
    /* 카테고리 리스트 */
    public List<CarCateDto> cateList();

}
