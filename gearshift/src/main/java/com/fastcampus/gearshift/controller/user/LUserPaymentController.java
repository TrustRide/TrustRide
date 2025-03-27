package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.CardPaymentDto;
import com.fastcampus.gearshift.dto.PaymentDto;
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
    public String getPaymentDetail(PaymentDto paymentDTO) {

        return "user/userPaymentDetail";
    }

    // 카드 결제 페이지 이동
    @PostMapping("/creditCard")
    public String goToPayment(CardPaymentDto cardPaymentDTO) {

        return "user/userPayment";
    }

}