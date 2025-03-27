package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.PaymentProcessDto;

public interface LPaymentService {

    // 결제 정보 저장
    int insert(PaymentProcessDto paymentProcessDTO);
}
