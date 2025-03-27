package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.DeliveryDto;

public interface LDeliveryService {

    // 배송 정보 저장
    int insert(DeliveryDto deliveryDTO);
}
