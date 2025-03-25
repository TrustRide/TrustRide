package com.fastcampus.gearshift.dao;

import com.fastcampus.gearshift.dto.NUserFormDto;
import com.fastcampus.gearshift.dto.UserDto;
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
    public List<UserDto> userForm() {
        return sqlSession.selectList(NAMESPACE + ".userList");
    }

    @Override
    public UserDto getUserFormById(Integer userId) {
        return sqlSession.selectOne(NAMESPACE + ".getUserFormById", userId);
    }

    @Override
    public void updateUserForm(Integer userId, UserDto updatedUserForm) {
        updatedUserForm.setUserId(userId); // 필수
        sqlSession.update(NAMESPACE + ".updateUserForm", updatedUserForm);
        System.out.println("변경 요청 비밀번호: " + updatedUserForm.getUserPassword());
        //update결과 db반영확인 : 0이면 update 반영 실패 , 1이나오는데 db반영안되면 컬럼명 mismatch
        int result = sqlSession.update(NAMESPACE + ".updateUserForm", updatedUserForm);
        System.out.println("업데이트 결과 row count: " + result);
    }

    @Override
    public void deleteUser(Integer userId) {
        System.out.println("[DAO] deleteUser() 실행 - userId: " + userId);    //테스트용 로그
        int result = sqlSession.delete(NAMESPACE + ".deleteUser", userId);
        System.out.println("[DAO] 삭제 쿼리 결과: " + result); // ✅ 이 값이 1이어야 성공  //테스트용 로그
    }
}
