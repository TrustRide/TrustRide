package com.fastcampus.gearshift.dto;

import lombok.Data;

@Data
public class ImageDto {

    private Integer imageId;  // 이미지 ID (Primary Key, AUTO_INCREMENT)
    private String imageUrl;  // 이미지 URL (Stored Image URL)
    private String imageType;  // 이미지 유형 (Image Type: e.g., "thumbnail", "interior", "exterior")
    private Integer carInfoId;  // 자동차 정보 ID (Foreign Key to CAR_INFORMATION)
    private Integer reviewId;  // 리뷰 ID (Foreign Key to REVIEW)
    private Integer inquiryId;  // 문의 ID (Foreign Key to INQUIRY)

}