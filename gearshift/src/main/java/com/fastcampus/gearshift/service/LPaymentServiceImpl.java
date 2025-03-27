package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.LPaymentDao;
import com.fastcampus.gearshift.dto.PaymentProcessDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LPaymentServiceImpl implements LPaymentService {

    @Autowired
    LPaymentDao paymentDao;

    // 결제 정보 저장
    @Override
    public int insert(PaymentProcessDto paymentProcessDTO) {

        return paymentDao.insert(paymentProcessDTO);
    }
}
