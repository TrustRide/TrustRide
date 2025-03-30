<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 쿠폰 목록</title>
    <link href="https://fonts.googleapis.com/css2?family=Pretendard&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/header.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/footer.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/sidebar.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/userCouponList.css' />">

</head>
<body>
<%
    request.setAttribute("hideSearch", true);
%>

<%-- 헤더 영역 --%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<%-- 사이드바 --%>
<%@ include file="/WEB-INF/views/user/include/sidebar.jsp" %>

<!-- 본문 -->
<main class="coupon-main">
    <section class="coupon-header">
    <h2>🎟 내 쿠폰 목록</h2>
    </section>
    <section class="coupon-table-section">
    <table>
        <thead>
        <tr>
            <th>쿠폰ID</th>
            <th>쿠폰명</th>
            <th>할인내용</th>
            <th>발급일</th>
            <th>사용여부</th>
            <th>사용하기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="coupon" items="${userCoupons}">
            <tr>
                <td>${coupon.issuedId}</td>
                <td>${coupon.couponName}</td>
                <td>${coupon.discountValue}원</td>
                <td>
                    <fmt:formatDate value="${coupon.issueDate}" pattern="yyyy-MM-dd HH:mm" />
                </td>
                <td>
                    <c:choose>
                        <c:when test="${coupon.isUsed}">
                            <span class="status-used">사용완료</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-unused">미사용</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${!coupon.isUsed}">
                        <form action="${pageContext.request.contextPath}/user/coupons/use" method="post">
                            <input type="hidden" name="issuedId" value="${coupon.issuedId}" />
                            <input type="hidden" name="userId" value="${coupon.userId}" />
                            <button type="submit" class="use-button">사용</button>
                        </form>
                    </c:if>
                    <c:if test="${coupon.isUsed}">
                        <span class="disabled">-</span>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </section>
</main>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>

</body>
</html>
