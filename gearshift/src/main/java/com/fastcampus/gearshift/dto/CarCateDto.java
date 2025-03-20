package com.fastcampus.gearshift.dto;

import lombok.*;

@Getter
@Setter
@RequiredArgsConstructor
@ToString
@AllArgsConstructor
public class CarCateDto {
    private int tier;
    private String cateName;
    private String cateCode;
    private String cateParent;
}
