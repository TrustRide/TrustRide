package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.NOrderListDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NOrderListDaoImpl implements NOrderListDao {

    private static final String NAMESPACE = "vw_order_summary";

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public List<NOrderListDto> orderList() {
        return sqlSession.selectList(NAMESPACE + ".orderList");
    }
}
