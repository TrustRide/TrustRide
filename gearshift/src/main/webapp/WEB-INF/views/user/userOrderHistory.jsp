<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>주문목록/배송조회</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/user/header.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/footer.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/sidebar.css' />">
</head>

<%--<!-- CDN 폰트/스타일 -->--%>
<%--<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">--%>
<%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">--%>
<%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">--%>
<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>

<%--<!-- 내부 css 경로 -->--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/header2.css">--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/sidebar.css">--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css">--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">--%>
<body>

<%-- 헤더 영역 --%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
    <%-- 사이드바 --%>
<%@ include file="/WEB-INF/views/user/include/sidebar.jsp" %>

    <c:forEach var="refund" items="${refundList}">
        <section>

            <div>
                <p>취소</p>
                <img src="${pageContext.request.contextPath}${order.thumbnailImageUrl}" style="width: 100%; max-width: 320px; border-radius: 8px; margin-bottom: 15px;" />
                <p>${refund.refundStatus}</p>
                <p>${refund.modelName}</p>
                <p>${refund.totalAmount}</p>
            </div>
        </section>
    </c:forEach>

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

</main>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/user/footer.css' />">
</body>
</html>

