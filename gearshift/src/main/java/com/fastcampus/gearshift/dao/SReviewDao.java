package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.ReviewDto;

import java.util.List;

public interface SReviewDao {
    int countAllReviews();
    List<ReviewDto> selectReviewsWithPaging(int offset, int limit);
    ReviewDto findById(Integer id);
    void insertReview(ReviewDto reviewDto);
    void deleteReview(Integer orderId);
}
