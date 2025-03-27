package com.fastcampus.gearshift.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

// 주문
@Data
@NoArgsConstructor
public class LOrderDto {

    private Integer orderId;        // 주문ID (PK) <- 여기에 자동 생성된 값이 들어옴
    private String productName;    // 주문 상품명(필요)
    private Integer orderAmount;   // 주문 금액(필요)
    private Integer discountAmount; // 할인된 금액
    private Integer totalAmount;   // 총 주문 가격 (할인 적용된 금액
    private String ownershipType;  // 소유유형
    private Boolean isJointOwnership; // 공동 명의 여부
    private String orderStatus;       // 주문상태
    private Integer userId;           // 유저 아이디

    public LOrderDto(String productName, Integer orderAmount, Integer discountAmount, Integer totalAmount, String ownershipType, Boolean isJointOwnership, Integer userId) {

        this.productName = productName; // 상품명
        this.orderAmount =  orderAmount; // 주문금액 = 자동차가격
        this.discountAmount = discountAmount;           // 할인된 금액
        this.totalAmount = totalAmount;    // 주문금액 - 할인된 금액
        this.ownershipType = ownershipType;  // 소유유형
        this.isJointOwnership = isJointOwnership;    // 공동명의 여부
        this.userId = userId;      // 유저 아이디

    }
}
