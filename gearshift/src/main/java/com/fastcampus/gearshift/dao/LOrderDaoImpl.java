package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.LOrderDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LOrderDaoImpl implements LOrderDao{

    @Autowired
    private SqlSessionTemplate session;
    private static String namespace = "com.fastcampus.gearshift.dao.LOrderMapper.";
    // 주문 정보 저장
    public int insertOrder(LOrderDto orderDto){
        return session.insert(namespace+"insertOrder", orderDto);
    }
    // 마지막 주문 ID 조회
    public int getLastOrderId() {
        return session.selectOne(namespace + "getLastOrderId");
    }

}
