package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.DeliveryDto;
import com.fastcampus.gearshift.dto.LOrderDto;
import com.fastcampus.gearshift.dto.PaymentProcessDto;
import com.fastcampus.gearshift.service.LDeliveryService;
import com.fastcampus.gearshift.service.LOrderService;
import com.fastcampus.gearshift.service.LPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/orders")
public class LUserOrderController {

    @Autowired
    private LOrderService orderService;

    @Autowired
    private LPaymentService paymentService;

    @Autowired
    private LDeliveryService deliveryService;

    // 현금 결제 후 주문내역/배송조회 페이지 이동
    @PostMapping("/status/cash")
    public String getOrderHistory(@ModelAttribute LOrderDto lOrderDTO , @ModelAttribute PaymentProcessDto paymentProcessDTO,
                                  @ModelAttribute DeliveryDto deliveryDTO){

        // 주문 상태
        lOrderDTO.setOrderStatus("주문완료");
        // 주문
        orderService.insertOrder(lOrderDTO);

        // 가장 마지막 주문 아이디 조회
        int orderId = orderService.getLastOrderId();

        // 결제 상태
        paymentProcessDTO.setPaymentStatus("결제완료");

        // 결제 테이블에 orderId 저장
        paymentProcessDTO.setOrderId(orderId);

        // 결제 정보 저장
        paymentService.insert(paymentProcessDTO);

        // 배송 상태
        deliveryDTO.setDeliveryStatus("배송준비중");

        // 배송 테이블에 orderId 저장
        deliveryDTO.setOrderId(orderId);

        // 배송 정보 저장
        deliveryService.insert(deliveryDTO);


        // 주문 목록 조회


        return  "user/userOrderHistory";
    }

    // 신용카드 결제 후 주문내역/배송조회 페이지 이동
    @PostMapping("status/credit")
    public String getOrderHistory2(@ModelAttribute LOrderDto lOrderDTO, @ModelAttribute PaymentProcessDto paymentProcessDTO,
                                   @ModelAttribute DeliveryDto deliveryDTO){


        // 주문 상태
        lOrderDTO.setOrderStatus("주문완료");
        // 주문 정보 저장
        orderService.insertOrder(lOrderDTO);

        // 가장 마지막 주문 아이디 조회
        int orderId = orderService.getLastOrderId();

        // 결제 상태
        paymentProcessDTO.setPaymentStatus("결제완료");

        // 결제 테이블에 orderId 저장
        paymentProcessDTO.setOrderId(orderId);

        // 결제 정보 저장
        paymentService.insert(paymentProcessDTO);

        // 배송 상태
        deliveryDTO.setDeliveryStatus("배송준비중");

        // 배송 테이블에 orderId 저장
        deliveryDTO.setOrderId(orderId);

        // 배송 정보 저장
        deliveryService.insert(deliveryDTO);

        // 주문 목록 조회

        return  "user/userOrderHistory";
    }
}
