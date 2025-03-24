<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원 프로필</title>
</head>
<body>
<h2>회원 프로필</h2>

<!-- 사용자 정보 폼 -->
<form action="/user/userForm" method="post">
    <input type="hidden" name="userId" value="${user.userId}" />

    고객명: <input type="text" name="userName" value="${user.userName}" readonly /><br/>
    비밀번호: <input type="password" name="userPassword" value="${user.userPassword}" /><br/>
    이메일: <input type="email" name="userEmail" value="${user.userEmail}" /><br/>
    연락처: <input type="text" name="userPhoneNumber" value="${user.userPhoneNumber}" /><br/>

    <button type="submit">변경하기</button>
</form>

<!-- 탈퇴 처리 -->
<form action="/user/delete" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
    <button type="submit">탈퇴하기</button>
</form>

<!-- 메시지 출력 -->
<c:if test="${not empty message}">
    <p style="color:green;">${message}</p>
</c:if>

</body>
</html>
