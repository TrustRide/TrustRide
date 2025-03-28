<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>주문목록/배송조회</title>
</head>
<body>
    <%-- 사이드바 --%>
<jsp:include page="include/sidebar.jsp"/>

<main class="order-list">
    <section>
        <h2>2025. 3. 13 주문</h2>
        <div>
            <p>취소중</p>
            <p>로켓와우 새우깡 미니팩, 120g, 1개</p>
            <p>2,250 원 - 1개</p>
        </div>
    </section>
<c:forEach var="order" items="${orderList}">
    <section>
        <h2>${order.orderCompletedDate} 주문</h2>
        <div>
            <p>${order.deliveryStatus} : <strong>${order.arrivalDate} 도착</strong></p>
            <p>${order.modelName}</p>
            <p>${order.totalAmount}</p>
            <button>환불 신청</button>
            <button>리뷰 작성하기</button>
        </div>
    </section>
</c:forEach>

</main>
</body>
</html>

