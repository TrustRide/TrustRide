package com.fastcampus.gearshift.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

// 주문 DTO
@Data
@NoArgsConstructor
public class LOrderDTO {


    // 주문 관련 필드
    private Integer orderId;            // 주문ID (PK)
    private String productName;         // 주문 상품명
    private Integer orderAmount;        // 주문 금액
    private Integer discountAmount;     // 할인된 금액
    private Integer totalAmount;        // 총 주문 가격 (할인 적용된 금액)
    private String ownershipType;       // 소유 유형
    private Boolean isJointOwnership;   // 공동 명의 여부
    private String orderStatus;         // 주문 상태
    private Integer userId;             // 유저 ID


    // 차량 관련 필드
    private String modelName;           // 차량 모델명
    private String manufactureYear;     // 연식
    private String mileage;             // 주행거리
    private String fuelType;            // 연료타입
    private int carPrice;               // 차량 가격
    private int extendedWarrantyPrice;  // 이전등록비
    private int maintenanceCost;        // 관리비용
    private int deliveryFee;            // 배송비
    private int carAmountPrice;         // 차량 총가격
    private int carInfoId = 1;          // 차량 ID
    private String codeId = "A1";       // 상태 코드 ID
    private String codeID = "환불상태 아닌게 없음"; // 설명 또는 상태 메시지?

    // 생성자
    public LOrderDTO(String productName, Integer orderAmount, Integer discountAmount, Integer totalAmount,
                     String ownershipType, Boolean isJointOwnership, Integer userId) {
        this.productName = productName;
        this.orderAmount = orderAmount;
        this.discountAmount = discountAmount;
        this.totalAmount = totalAmount;
        this.ownershipType = ownershipType;
        this.isJointOwnership = isJointOwnership;
        this.userId = userId;
    }
}
