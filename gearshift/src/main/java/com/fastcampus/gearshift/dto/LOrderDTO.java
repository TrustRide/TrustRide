package com.fastcampus.gearshift.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

// 주문
@Data
@AllArgsConstructor
public class LOrderDTO {

    private String modelName; // 차량 모델명
    private String manufactureYear;  // 연식
    private String mileage;          // 주행거리
    private String fuelType;         // 연료타입
    private int carPrice;           // 차량 가격
    private int previousRegistrationFee;    // 이전등록비
    private int maintenanceCost;    // 관리비용
    private int deliveryFee;        // 배송비
    private int carAmountPrice;     // 차량 총가격
    private String userId;          // 유저 아이디
    private int carInfoId = 1;      // 차동차 아이디
    private String codeId = "A1";
    private String codeID = "환불상태 아닌게 없음";

}
