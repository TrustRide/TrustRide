package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.DeliveryDto;

public interface LDeliveryDao {

    // 배송 정보 저장
    int insert(DeliveryDto deliveryDTO);
}
