package com.fastcampus.gearshift.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class LRefundDTO {

    private String modelName;        // 상품 이름
    private Integer orderAmount;     // 상품 가격
    private Integer totalAmount;     // 총 환불 예상 금액
    private Integer deliveryFee;     // 배송비
    private Integer refundFee;       // 반품비
    private String refundReason;     // 반품사유
    private String refundStatus;     // 반품 상태
    private Integer orderId;         // 주문 아이디

    public LRefundDTO(Integer orderAmount, Integer totalAmount, Integer orderId) {
        this.orderAmount = orderAmount;
        this.totalAmount = totalAmount;
        this.orderId = orderId;
    }
}
