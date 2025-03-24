package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.NUserFormDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NUserFormDaoImpl implements NUserFormDao {

    private static final String NAMESPACE = "userForm"; // MyBatis 매퍼 네임스페이스

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<NUserFormDto> userForm() {
        return sqlSession.selectList(NAMESPACE + ".userList");
    }

    @Override
    public NUserFormDto getUserFormById(Integer userId) {
        return sqlSession.selectOne(NAMESPACE + ".getUserFormById", userId);
    }

    @Override
    public void updateUserForm(NUserFormDto updatedUserForm) {
        sqlSession.update(NAMESPACE + ".updateUserForm", updatedUserForm);
    }

    @Override
    public void deleteUser(Integer userId) {
        sqlSession.delete(NAMESPACE + ".deleteUser", userId);
    }
}
