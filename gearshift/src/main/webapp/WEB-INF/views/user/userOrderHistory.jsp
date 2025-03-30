<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>주문목록/배송조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Pretendard&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/header.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/sidebar.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/footer.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/userOrderHistory.css' />">
</head>
<body>

<%
    request.setAttribute("hideSearch", true);
%>

<%-- 헤더 영역 --%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<<<<<<< Updated upstream

    <%-- 사이드바 --%>
<%@ include file="/WEB-INF/views/user/include/sidebar.jsp" %>




    <c:forEach var="refund" items="${refundList}">
        <section>
=======
<%-- 사이드바 --%>
<%@ include file="/WEB-INF/views/user/include/sidebar.jsp" %>

>>>>>>> Stashed changes

<main class="order-main">
    <div class="order-container content">
        <h1 class="order-title">주문목록</h1>

<<<<<<< Updated upstream
<c:forEach var="order" items="${orderList}">
    <section>
        <h2>${order.orderCompletedDate} 주문</h2>
        <div>
            <img src="${pageContext.request.contextPath}${order.thumbnailImageUrl}" style="width: 100%; max-width: 320px; border-radius: 8px; margin-bottom: 15px;" />
            <p>${order.deliveryStatus} : <strong>${order.arrivalDate} 도착</strong></p>
            <p>${order.modelName}</p>
            <p>${order.totalAmount}</p>
        </div>
    </section>

</c:forEach>
=======
        <!-- 환불 내역 -->
        <c:choose>
            <c:when test="${empty refundList}">
                <p class="empty-message">환불 내역이 없습니다.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="refund" items="${refundList}">
                    <section class="order-section">
                        <h2 class="order-title">[환불]</h2>
                        <div class="order-box">
                            <p>취소</p>
                            <img src="${pageContext.request.contextPath}${order.thumbnailImageUrl}" class="order-img"/>
                            <div class="order-info">
                                <p>${refund.refundStatus}</p>
                                <p>${refund.modelName}</p>
                                <p>${refund.totalAmount}</p>
                            </div>
                        </div>
                    </section>
                </c:forEach>
            </c:otherwise>
        </c:choose>
>>>>>>> Stashed changes


        <!-- 주문 내역 -->
        <c:choose>
            <c:when test="${empty orderList}">
                <p class="empty-message">주문 내역이 없습니다.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="order" items="${orderList}">
                    <section class="order-section">
                        <h2 class="order-date">${order.orderCompletedDate} 주문</h2>
                        <div class="order-box">
                            <img src="${pageContext.request.contextPath}${order.thumbnailImageUrl}" class="order-img"/>
                            <div class="order-info">
                                <p class="model-name">${order.modelName}</p>
                                <p class="price">${order.totalAmount}만원</p>
                                <p class="status">${order.deliveryStatus} : <strong>${order.arrivalDate} 도착</strong></p>
                            </div>
                        </div>
                    </section>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</main>



<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>
</body>
</html>

