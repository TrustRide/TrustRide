package com.fastcampus.gearshift.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class LUserPaymentController {

    @GetMapping("/select")
    public String paymentSelect(){
        return "user/userChoosePayment";
    }


    @PostMapping("/detail")
    public String paymentDetail(){



        return "user/userPaymentDetail";
    }

}
