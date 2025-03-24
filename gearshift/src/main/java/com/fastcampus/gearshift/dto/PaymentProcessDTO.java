package com.fastcampus.gearshift.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

// 결제 처리용 DTO
@Data
@NoArgsConstructor
public class PaymentProcessDTO {


    // 결제 정보
    private String paymentMethod;   // 결제 수단
    private int orderId;            // 주문 ID
    private String paymentStatus;   // 결제 상태


    // 차량 정보
    private String modelName;           // 차량 모델명
    private String carNum;              // 차량 번호판
    private String manufactureYear;     // 연식
    private String mileage;             // 주행거리
    private String fuelType;            // 연료 타입
    private int carPrice;               // 차량 가격
    private int extendedWarrantyPrice;  // 이전 등록비
    private int maintenanceCost;        // 관리비용
    private int deliveryFee;            // 배송비
    private int carAmountPrice;         // 차량 총 가격
    private String imageUrl;            // 이미지 경로


    // 생성자 (결제 수단만 받는 간단 생성자)
    public PaymentProcessDTO(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

}
