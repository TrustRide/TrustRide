package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.SReviewDao;
import com.fastcampus.gearshift.dto.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class SReviewServiceImpl implements SReviewService {

    @Autowired
    SReviewDao reviewDao;

    @Override
    public int getTotalReviewCount() {
        return reviewDao.countAllReviews();
    }

    @Override
    public List<ReviewDto> getReviewsWithPaging(int offset, int limit) {
        return reviewDao.selectReviewsWithPaging(offset, limit);
    }

    @Override
    public ReviewDto getReviewById(Integer id) {
        return reviewDao.findById(id);
    }

    @Override
    public void registerReview(ReviewDto reviewDto, MultipartFile image) {
        reviewDao.insertReview(reviewDto);
    }

    @Override
    public void deleteReview(Integer orderId) {
        reviewDao.deleteReview(orderId);
    }

}
