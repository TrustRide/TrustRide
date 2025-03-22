package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PHolderImpl implements  PHolderDao{
    @Autowired
    private SqlSession session;
    private static final String namespace = "com.fastcampus.gearshift.";


    @Override
    public int update(UserDto userDto) throws Exception {
        return session.update(namespace+"update",userDto);
    }

    @Override
    public UserDto select(Integer userId) throws Exception {
       return session.selectOne(namespace+"select",userId);
    }
}
