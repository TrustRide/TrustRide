<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠폰 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>쿠폰 수정</h1>

<form action="${pageContext.request.contextPath}/admin/coupons/edit/${couponDto.couponId}" method="post">
    <input type="hidden" name="couponId" value="${couponDto.couponId}">

    <label>쿠폰명:</label>
    <input type="text" name="couponName" value="${couponDto.couponName}" required><br>


    <label>할인 값:</label>
    <input type="number" name="discountValue" value="${couponDto.discountValue}" required><br>

    <label>최소 주문 금액:</label>
    <input type="number" name="minOrderAmount" value="${couponDto.minOrderAmount}" required><br>

    <label>할인 금액:</label>
    <input type="number" name="discountAmount" value="${couponDto.discountAmount}" required><br>

    <label>시작 날짜:</label>
    <input type="date" name="startDate" value="${couponDto.startDate}" required><br>

    <label>종료 날짜:</label>
    <input type="date" name="endDate" value="${couponDto.endDate}" required><br>

    <label>활성 여부:</label>
    <input type="checkbox" name="isActive" ${couponDto.isActive ? 'checked' : ''}><br>

    <button type="submit">수정 완료</button>
</form>

<a href="${pageContext.request.contextPath}/admin/coupons">목록으로 돌아가기</a>
</body>
</html>
