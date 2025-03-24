package com.fastcampus.gearshift.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

// 주문
@Data
@NoArgsConstructor
public class LOrderDTO {

<<<<<<< Updated upstream
    private Integer orderId;        // 주문ID (PK) <- 여기에 자동 생성된 값이 들어옴
    private String productName;    // 주문 상품명(필요)
    private Integer orderAmount;   // 주문 금액(필요)
    private Integer discountAmount; // 할인된 금액
    private Integer totalAmount;   // 총 주문 가격 (할인 적용된 금액
    private String ownershipType;  // 소유유형
    private Boolean isJointOwnership; // 공동 명의 여부
    private String orderStatus;       // 주문상태
    private Integer userId;           // 유저 아이디
=======
    private String modelName; // 차량 모델명
    private String manufactureYear;  // 연식
    private String mileage;          // 주행거리
    private String fuelType;         // 연료타입
    private int carPrice;           // 차량 가격
    private int extendedWarrantyPrice;    // 이전등록비
    private int maintenanceCost;    // 관리비용
    private int deliveryFee;        // 배송비
    private int carAmountPrice;     // 차량 총가격
    private String userId;          // 유저 아이디
    private int carInfoId = 1;      // 차동차 아이디
    private String codeId = "A1";
    private String codeID = "환불상태 아닌게 없음";
>>>>>>> Stashed changes

    public LOrderDTO(String productName, Integer orderAmount, Integer discountAmount,Integer totalAmount, String ownershipType, Boolean isJointOwnership,Integer userId) {

        this.productName = productName; // 상품명
        this.orderAmount =  orderAmount; // 주문금액 = 자동차가격
        this.discountAmount = discountAmount;           // 할인된 금액
        this.totalAmount = totalAmount;    // 주문금액 - 할인된 금액
        this.ownershipType = ownershipType;  // 소유유형
        this.isJointOwnership = isJointOwnership;    // 공동명의 여부
        this.userId = userId;      // 유저 아이디

    }
}
