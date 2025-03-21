package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.PaymentDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class LUserPaymentController {


    @GetMapping("/select")
    public String selectPayment() {
        return "user/userChoosePayment";
    }


    // 결제 상세 페이지 이동
    @PostMapping("/detail")
    public String getPaymentDetail(PaymentDTO paymentDTO) {

        return "user/userPaymentDetail";
    }

    // 카드 결제 페이지 이동
    @PostMapping("/creditCard")
    public String goToPayment(PaymentDTO paymentDTO) {

        return "user/userPayment";
    }

}