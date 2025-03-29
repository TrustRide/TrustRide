package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.LOrderDao;
import com.fastcampus.gearshift.dto.LOrderDTO;
import com.fastcampus.gearshift.dto.LOrderListDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LOrderServiceImpl implements LOrderService{

    @Autowired
    private LOrderDao orderDao;


    // 주문 정보 저장
    @Override
    public int insertOrder(LOrderDTO orderDto) {

        int orderAmount = orderDto.getCarAmountPrice(); // 차량 총 가격 = 주문 가격
        int discountAmount = 0; // 할인가격 0원
        int totalAmount = orderAmount + discountAmount; // 총 주문 가격

        orderDto.setOrderAmount(orderAmount);        // 주문 가격
        orderDto.setDiscountAmount(discountAmount);  // 할인가격
        orderDto.setTotalAmount(totalAmount);        // 총 주문 가격
        orderDto.setOrderStatus("주문완료");          // 주문상태 세팅

        return orderDao.insertOrder(orderDto);
    }

    // 가장 마지막 저장된 orderId 가져오기
    @Override
    public int getLastOrderId() {
        return orderDao.getLastOrderId();
    }

    // 주문 목록 조회
    @Override
    public List<LOrderListDTO> getLOrderList(Integer userId) {
        return orderDao.getLOrderList(userId);
    }

    @Override
    public int selectCarInfo(Integer orderId) {
        return orderDao.selectCarInfo(orderId);
    }

    // 판매 완료된 상품 처리
    @Override
    public int updateOrder(Integer  carInfoId) {
        return orderDao.updateOrder(carInfoId);
    }


}
