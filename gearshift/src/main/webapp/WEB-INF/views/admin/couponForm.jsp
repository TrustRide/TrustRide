<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠폰 생성</title>
</head>
<body>
<h1>쿠폰 생성</h1>

<form action="${pageContext.request.contextPath}/admin/coupons/create" method="post">
    <label>쿠폰명:</label>
    <input type="text" name="couponName" value="${couponDto.couponName}" required><br>

    <label>할인 값:</label>
    <input type="number" name="discountValue" value="${couponDto.discountValue}" required><br>

    <label>최소 주문 금액:</label>
    <input type="number" name="minOrderAmount" value="${couponDto.minOrderAmount}" required><br>

    <label>할인 금액:</label>
    <input type="number" name="discountAmount" value="${couponDto.discountAmount}" required><br>

    <label>시작 날짜:</label>
    <input type="date" name="startDate" value="${couponDto.startDate != null ? couponDto.startDate : ''}"><br>

    <label>종료 날짜:</label>
    <input type="date" name="endDate" value="${couponDto.endDate != null ? couponDto.endDate : ''}"><br>

    <label>활성 여부:</label>
    <input type="checkbox" name="isActive" ${couponDto.isActive ? 'checked' : ''}><br>

    <button type="submit">쿠폰 생성</button>
</form>

<a href="${pageContext.request.contextPath}/admin/coupons/list">목록으로 돌아가기</a>
</body>
</html>
