package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PHolderDaoImpl implements  PHolderDao{
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

    @Override
    public List<CarDto> carselect() {
        return session.selectList(namespace+"selectList");
    }

    @Override
    public CarDto carSelect(Integer carInfoId) throws Exception {
        return session.selectOne(namespace+"carSelect",carInfoId);
    }

    @Override
    public UserDto userSelect(Integer userId) throws Exception {
        return session.selectOne(namespace+"userSelect",userId);
    }


}
