package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.LOrderDto;

public interface LOrderService {

    // 주문 정보 저장
    int insertOrder(LOrderDto orderDto);

    // 가장 마지막에 저장된 orderId 가져오기
    int getLastOrderId();
}
