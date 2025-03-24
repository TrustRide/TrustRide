package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.LOrderDao;
import com.fastcampus.gearshift.dto.LOrderDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LOrderServiceImpl implements LOrderService{

    @Autowired
    private LOrderDao orderDao;


    // 주문 정보 저장
    @Override
    public int insertOrder(LOrderDTO orderDto) {
        return orderDao.insertOrder(orderDto);
    }

    // 가장 마지막 저장된 orderId 가져오기
    @Override
    public int getLastOrderId() {
        return orderDao.getLastOrderId();
    }


}
