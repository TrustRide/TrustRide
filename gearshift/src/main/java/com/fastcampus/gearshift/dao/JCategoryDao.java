package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.CategoryDto;

import java.util.List;

public interface JCategoryDao {
    List<CategoryDto> findByTier(int tier);

    List<CategoryDto> findByParentCode(String parentCode);
}
