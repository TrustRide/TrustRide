package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.*;
import com.fastcampus.gearshift.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/user/orders")
public class LUserOrderController {

    @Autowired
    private LHolderService holderService;

    @Autowired
    private LOrderService orderService;

    @Autowired
    private LPaymentService paymentService;

    @Autowired
    private LDeliveryService deliveryService;

    @Autowired
    private LRefundService refundService;


    // 현금 결제 후 주문내역/배송조회 페이지 이동
    @PostMapping("/status/cash")
    public String getOrderHistory(@ModelAttribute LOrderDTO lOrderDTO ,@ModelAttribute PaymentProcessDTO paymentProcessDTO,
                                  @ModelAttribute LHolderDTO lHolderDTO,  @ModelAttribute DeliveryDTO deliveryDTO, HttpSession session, @RequestParam Integer carInfoId){


        // userId를 session에서 꺼내주기
        UserDto userDto =  (UserDto)session.getAttribute("loginUser");
        Integer userId = userDto.getUserId();

        // 명의자 정보 저장
        holderService.insertHolder(lHolderDTO);

        // 명의자 Id(PK) 가져오기
        Integer holderId = lHolderDTO.getHolderId();

        // dto에 userId를 넣어준다.
        lOrderDTO.setUserId(userId);

        // dto에 holderId를 넣어준다.
        lOrderDTO.setHolderId(holderId);


        // 주문
        orderService.insertOrder(lOrderDTO);

        // 가장 마지막 주문 아이디 조회
        Integer orderId = orderService.getLastOrderId();


        // 결제 테이블에 orderId 저장
        paymentProcessDTO.setOrderId(orderId);

        // 결제 정보 저장
        paymentService.insert(paymentProcessDTO);


        // 배송 테이블에 orderId 저장
        deliveryDTO.setOrderId(orderId);

        // 배송 정보 저장
        deliveryService.insert(deliveryDTO);

        // 자동차 아이디 조회
        Integer carId = orderService.selectCarInfo(orderId);

        // 판매중에서 판매완료로 설정
        orderService.updateOrder(carId);


        return  "redirect:/user/orders/status/orderList";
    }

    // 신용카드 결제 후 주문내역/배송조회 페이지 이동
    @PostMapping("/status/credit")
    public String getOrderHistory2(@ModelAttribute LOrderDTO lOrderDTO ,@ModelAttribute PaymentProcessDTO paymentProcessDTO,
                                   @ModelAttribute LHolderDTO lHolderDTO,  @ModelAttribute DeliveryDTO deliveryDTO, HttpSession session){


        // userId를 session에서 꺼내주기
        UserDto userDto =  (UserDto)session.getAttribute("loginUser");
        Integer userId = userDto.getUserId();


        // 명의자 정보 저장
        holderService.insertHolder(lHolderDTO);

        // 명의자 Id(PK) 가져오기
        Integer holderId = lHolderDTO.getHolderId();

        // dto에 userId를 넣어준다.
        lOrderDTO.setUserId(userId);

        // dto에 holderId를 넣어준다.
        lOrderDTO.setHolderId(holderId);


        // 주문
        orderService.insertOrder(lOrderDTO);

        // 가장 마지막 주문 아이디 조회
        Integer orderId = orderService.getLastOrderId();


        // 결제 테이블에 orderId 저장
        paymentProcessDTO.setOrderId(orderId);

        // 결제 정보 저장
        paymentService.insert(paymentProcessDTO);


        // 배송 테이블에 orderId 저장
        deliveryDTO.setOrderId(orderId);

        // 배송 정보 저장
        deliveryService.insert(deliveryDTO);

        return  "redirect:/user/orders/status/orderList";
    }

    // 주문 목록 리스트
    @GetMapping("/status/orderList")
    public String getOrderList(HttpSession session,Model model) throws Exception {

        // userId를 session에서 꺼내주기
        UserDto userDto =  (UserDto)session.getAttribute("loginUser");
        Integer userId = userDto.getUserId();

        // 주문 목록 조회
        List<LOrderListDTO> orderListDTO = orderService.getLOrderList(userId);
        model.addAttribute("orderList", orderListDTO);

        // 반품목록
        List<LRefundDTO> refundDTOList = refundService.getRefundList(userId);
        model.addAttribute("refundList", refundDTOList);

        return "user/userOrderHistory";
    }
}
