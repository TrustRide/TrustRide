<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 쿠폰 목록</title>
</head>
<body>
<h1>내 쿠폰 목록</h1>

<!-- 쿠폰 목록 표시 -->
<table border="1">
    <tr>
        <th>쿠폰ID</th>
        <th>발급일</th>
        <th>사용됨?</th>
        <th>사용하기</th>
    </tr>
    <c:forEach var="coupon" items="${userCoupons}">
        <tr>
            <td>${coupon.issuedId}</td>
            <td><fmt:formatDate value="${coupon.issueDate}" pattern="yyyy-MM-dd HH:mm" /></td>
            <td>${coupon.isUsed ? 'Y' : 'N'}</td>
            <td>
                <form action="${pageContext.request.contextPath}/user/coupons/use/${coupon.issuedId}" method="post">
                    <!-- userId를 쿼리 파라미터로 전달 -->
                    <input type="hidden" name="userId" value="${coupon.userId}"/>
                    <button type="submit">사용</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- 성공/오류 메시지 -->
<c:if test="${not empty successMessage}">
    <div style="color:green">${successMessage}</div>
</c:if>
<c:if test="${not empty errorMessage}">
    <div style="color:red">${errorMessage}</div>
</c:if>

</body>
</html>
