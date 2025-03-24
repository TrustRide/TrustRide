<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/styles.css">
</head>
<body>

<!-- 헤더 포함 -->
<jsp:include page="include/header.jsp"/>

<!-- 사이드바 포함 -->
<jsp:include page="include/sidebar.jsp"/>


<main class="content">
    <h2>회원 관리</h2>
    <table border="1">
        <thead>
        <tr>
            <th>회원코드</th>
            <th>회원이름</th>
            <th>아이디</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>유저등록일</th>
            <th>성별</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userAccount}</td>
                <td>${user.userPhoneNumber}</td>
                <td>${user.userEmail}</td>
                <td>${user.createdAt}</td>
                <td>${user.userGender}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

</body>
</html>