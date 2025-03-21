package com.fastcampus.gearshift.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/orders")
public class LUserOrderController {


    // 현금 결제 후 주문내역/배송조회 페이지 이동
    @PostMapping("/status/cash")
    public String getOrderHistory(){
        return  "user/userOrderHistory";
    }

    // 신용카드 결제 후 주문내역/배송조회 페이지 이동
    @PostMapping("status/credit")
    public String getOrderHistory2(){
        return  "user/userOrderHistory";
    }
}
