package com.fastcampus.gearshift.dto;

import lombok.Data;

@Data
public class AdminProductDTO {
    private int carInfoId;
    private String modelName;
    private String mileage;
    private String engineCapacity;
    private String fuelType;
    private String color;
    private int carPrice;
    private String imageUrl;
}
