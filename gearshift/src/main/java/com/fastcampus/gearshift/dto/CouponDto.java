package com.fastcampus.gearshift.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter
@Setter
@ToString
public class CouponDto {
    private int couponId;
    private String couponName;
    private String discountType;
    private int discountValue;
    private int minOrderAmount;
    private int discountAmount;
    private LocalDate startDate;
    private LocalDate endDate;
    private Boolean isActive;
    private String codeId;
}
