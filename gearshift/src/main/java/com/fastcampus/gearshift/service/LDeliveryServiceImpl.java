package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.LDeliveryDao;
import com.fastcampus.gearshift.dto.DeliveryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LDeliveryServiceImpl implements LDeliveryService {

    @Autowired
    LDeliveryDao deliveryDao;

    // 배송 정보 저장
    @Override
    public int insert(DeliveryDto deliveryDTO) {
        return deliveryDao.insert(deliveryDTO);
    }
}
