package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.NUserListDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NUserListDaoImpl implements NUserListDao {

    private static final String NAMESPACE = "adminUserList";

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public List<NUserListDto> userList() {
        return sqlSession.selectList(NAMESPACE + ".userList");
    }
}
