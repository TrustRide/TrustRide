<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/styles.css">
</head>
<body>

<!-- 헤더 포함 -->
<jsp:include page="include/header.jsp"/>

<!-- 사이드바 포함 -->
<jsp:include page="include/sidebar.jsp"/>


<main class="content">
    <h2>주문 관리</h2>
    <table border="1">
        <thead>
        <tr>
            <th>회원이름</th>
            <th>회원코드</th>
            <th>주문코드</th>
            <th>주문가격</th>
            <th>주문상태</th>
            <th>주문일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orderList}">
            <tr>
                <td>${order.userName}</td>
                <td>${order.userId}</td>
                <td>${order.orderId}</td>
                <td>${order.totalPrice}</td>
                <td>${order.orderStatus}</td>
                <td>${order.orderCompletedDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

</body>
</html>

