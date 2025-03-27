package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.CarInfoDto;
import com.fastcampus.gearshift.dto.CarListDto;
import com.fastcampus.gearshift.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PHolderDaoImpl implements  PHolderDao{
    @Autowired
    private SqlSession session;
    private static final String namespace = "com.fastcampus.gearshift.";




    @Override
    public UserDto select(Integer userId) throws Exception {
       return session.selectOne(namespace+"select",userId);
    }

    @Override
    public List<CarListDto> carselect() {
        return session.selectList(namespace+"selectList");
    }

    @Override
    public CarInfoDto carSelect(Integer carInfoId) throws Exception {
        return session.selectOne(namespace+"carSelect",carInfoId);
    }

    @Override
    public UserDto userSelect(Integer userId) throws Exception {
        return session.selectOne(namespace+"userSelect",userId);
    }


    //메인화면 검색
    @Override
    public List<CarListDto> searchCarsByTitle(String title) throws Exception {
        return session.selectList(namespace+"searchCarsByTitle","%"+title+"%");
    }


    @Override
    public List<CarListDto> carselect(int offset, int pageSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("pageSize", pageSize);
        return session.selectList(namespace + "selectList", params);
    }
    @Override
    public int getCarCount() {
        return session.selectOne(namespace+"getCarCount");
    }

    @Override
    public List<CarListDto> carselectByCate(String cateCode, int offset, int pageSize) {

        // cateCode 디버깅
        System.out.println("cateCode Dao 디버깅 = " + cateCode);

        Map<String, Object> params = new HashMap<>();
        params.put("cateCode", cateCode);
        params.put("offset", offset);
        params.put("pageSize", pageSize);
        return session.selectList(namespace + "selectListByCate", params);
    }

    @Override
    public int getCarCountByCate(String cateCode) {
        return session.selectOne(namespace + "getCarCountByCate", cateCode);
    }



}



