package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.PaymentProcessDto;

public interface LPaymentDao {

    // 결제 정보 저장
    int insert(PaymentProcessDto paymentProcessDTO);
}
