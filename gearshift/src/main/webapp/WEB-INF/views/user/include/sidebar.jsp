<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<aside class="sidebar">
    <div>
        <h3>주문목록</h3>
    </div>
    <ul>
        <li><h4>MY 쇼핑</h4></li>
<<<<<<< Updated upstream
        <li><a href="${pageContext.request.contextPath}/orders/status/orderList">주문목록/배송조회</a></li>
        <li><a href="${pageContext.request.contextPath}/user/orders/refundable">환불/환불내역</a></li>
=======
        <li><a href="/gearshift/user/orders/status/orderList">주문목록/배송조회</a></li>
        <li><a href="/gearshift/user/orders/refundable">환불/환불내역</a></li>
>>>>>>> Stashed changes
        <li><h4>MY 혜택</h4></li>
        <li><a href="#">할인코드</a></li>
        <li><h4>MY 활동</h4></li>
        <li><a href="${pageContext.request.contextPath}/user/review/list">리뷰관리</a></li>
        <li><a href="#">찜 리스트</a></li>
        <li><h4>MY 정보</h4></li>
        <li><a href="${pageContext.request.contextPath}/user/userForm">개인정보확인/수정</a></li>
    </ul>
</aside>

</body>
</html>
