package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SReviewDaoImpl implements SReviewDao {

    @Autowired
    private SqlSession sqlSession;

    private static final String namespace = "reviewMapper.";

    @Override
    public int countAllReviews() {
        return sqlSession.selectOne(namespace + "countAllReviews");
    }

    //MyBatis에서 파라미터 두 개 이상 넘길 때 자주 쓰는 방식
    //@Param("offset") int offset, @Param("limit") int limit도 가능
    @Override
    public List<ReviewDto> selectReviewsWithPaging(int offset, int limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        return sqlSession.selectList(namespace + "selectReviewsWithPaging", params);
    }

    @Override
    public ReviewDto findById(Integer id) {
        return sqlSession.selectOne(namespace + "findById", id);
    }

    @Override
    public void insertReview(ReviewDto reviewDto) {
        sqlSession.insert(namespace + "insertReview", reviewDto);
    }

    @Override
    public void deleteReview(Integer orderId) {
        sqlSession.update(namespace + "deleteReview", orderId);
    }

}
