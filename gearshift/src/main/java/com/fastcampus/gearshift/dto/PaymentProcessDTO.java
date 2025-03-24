package com.fastcampus.gearshift.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

// 결제
@Data
@NoArgsConstructor
public class PaymentProcessDTO {

    private String paymentMethod;  //결제수단
<<<<<<< Updated upstream
    private int orderId;       // 주문아이디
    private String paymentStatus;  // 결제상태

    public PaymentProcessDTO(String paymentMethod) {

        this.paymentMethod = paymentMethod;

    }

=======
    private String modelName; // 차량 모델명
    private String carNum;   // 차량 번호판
    private String manufactureYear;  // 연식
    private String mileage;          // 주행거리
    private String fuelType;         // 연료타입
    private int carPrice;           // 차량 가격
    private int extendedWarrantyPrice;    // 이전등록비
    private int maintenanceCost;    // 관리비용
    private int deliveryFee;        // 배송비
    private int carAmountPrice;     // 차량 총가격
    private String imageUrl;        // 이미지 경로
>>>>>>> Stashed changes
}
