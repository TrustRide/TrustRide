package com.fastcampus.gearshift.dto;
import lombok.Data;


@Data
public class CarDetailDto {
    //private List<ImageDto> images;
    private Integer carInfoId;  // 자동차 정보 ID (Primary Key, AUTO_INCREMENT)
    private String modelName;  // 모델명 (Car Model Name)
    private String engineCapacity;  // 엔진 배기량 (Engine Capacity)
    private String carNum;  // 차량 번호 (Car Number)
    private String manufactureYear;  // 제조 연도 (Manufacture Year)
    private String mileage;  // 주행 거리 (Mileage)
    private String fuelType;  // 연료 종류 (Fuel Type: Gasoline, Diesel, etc.)
    private Integer carPrice;  // 차량 가격 (Car Price)
    private Integer previousRegistrationFee;  // 이전 등록비 (Previous Registration Fee)
    private Integer maintenanceCost;  // 유지보수 비용 (Maintenance Cost)
    private Integer agencyFee;  // 등록대행수수료 (agency Fee)
    private Integer deliveryFee;//배송비
    private Integer carAmountPrice;  // 총 차량 금액 (Total Car Amount Price)
    //private List<ImageDto> images;
    private Integer holderId;
    private String holderName;
    private String holderPhoneNumber;
    private String holderAddr1;
    private String holderAddr2;
    private String holderAddr3;
    private String holderResident;
    private String license;

    private Integer deliveryId;
    private String deliveryDriverName;




    
    public CarDetailDto(Integer carInfoId, String modelName, String engineCapacity, String carNum, String manufactureYear, String mileage, String fuelType, Integer carPrice, Integer previousRegistrationFee, Integer maintenanceCost, Integer agencyFee, Integer carAmountPrice) {
        this.carInfoId = carInfoId;
        this.modelName = modelName;
        this.engineCapacity = engineCapacity;
        this.carNum = carNum;
        this.manufactureYear = manufactureYear;
        this.mileage = mileage;
        this.fuelType = fuelType;
        this.carPrice = carPrice;
        this.previousRegistrationFee = previousRegistrationFee;
        this.maintenanceCost = maintenanceCost;
        this.agencyFee = agencyFee;
        this.carAmountPrice = carAmountPrice;
    }



    public void setDeliveryFee(Integer deliveryFee) {
        this.deliveryFee = 0;
    }
}
