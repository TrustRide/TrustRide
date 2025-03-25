package com.fastcampus.gearshift.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
public class ReviewDto {
    private Integer reviewId;
    private String reviewTitle;
    private String reviewContent;
    private Integer rating;
    private Integer orderId;
    private Integer carInfoId;
    private Integer userId;
    private String userName;
    private Boolean isDeleted;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    //private ImageDto image; // 업로드 이미지 정보

    public String getFormattedCreatedAt() {
        return createdAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }

    public String getFormattedUpdatedAt() {
        return updatedAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }
}
