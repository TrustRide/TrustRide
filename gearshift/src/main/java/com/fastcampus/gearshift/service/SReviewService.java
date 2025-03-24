package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dto.ReviewDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface SReviewService {
    int getTotalReviewCount();
    List<ReviewDto> getReviewsWithPaging(int offset, int limit);
    ReviewDto getReviewById(Integer id);
    void registerReview(ReviewDto reviewDto, MultipartFile image);
    void deleteReview(Integer orderId);
}
