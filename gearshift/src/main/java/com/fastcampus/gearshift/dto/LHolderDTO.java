package com.fastcampus.gearshift.dto;

import lombok.Data;

@Data
public class LHolderDTO {
    private Integer holderId;
    private String holderName;
    private String holderPhoneNumber;
    private String holderResident;
    private String holderAddr1;
    private String holderAddr2;
    private String holderAddr3;
    private String holderLicense;

    public LHolderDTO(String holderName, String holderPhoneNumber, String holderResident, String holderAddr1, String holderAddr2, String holderAddr3, String license) {
        this.holderName = holderName;
        this.holderPhoneNumber = holderPhoneNumber;
        this.holderResident = holderResident;
        this.holderAddr1 = holderAddr1;
        this.holderAddr2 = holderAddr2;
        this.holderAddr3 = holderAddr3;
        this.holderLicense = holderLicense;
    }
}
