package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.LOrderDto;

public interface LOrderDao {

    // 주문 정보 저장
    int insertOrder(LOrderDto orderDto);

    // 마지막 주문 ID 조회
    int getLastOrderId();
}
