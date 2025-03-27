package com.fastcampus.gearshift.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
public class CarListDto {
    private Integer carInfoId;
    private String modelName;// 자동차 정보 ID (Primary Key, AUTO_INCREMENT)
    private String manufactureYear;  // 제조 연도 (Manufacture Year)
    private String mileage;  // 주행 거리 (Mileage)
    private String fuelType;  // 연료 종류 (Fuel Type: Gasoline, Diesel, etc.)
    private Integer carPrice;  // 차량 가격 (Car Price)
    //private List<ImageDto> images;
    // 썸네일
//    private String thumbnailUrl;
//    private Integer thumbnailImageId;

    // DB와 상관x 있어도 다른거에 영향x
    private Boolean isWished;

}
