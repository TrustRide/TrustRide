<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>취소 신청 완료</title>
</head>
<body>

    <jsp:include page="include/sidebar.jsp"/>

    <main>
        <!-- 취소 신청 완료 내용 -->
        <section>
            <h3>취소 신청이 완료되었습니다.</h3>
            <p>취소 상품</p>

            <p>${refundDTO.modelName}</p>
            <p>${refundInfo.totalAmount} 만원</p>
        </section>
        <section>
            <button onclick="window.location.href='/gearshift/orders/status/orderList'">신청내역 확인하기</button>
            <button onclick="window.location.href='/gearshift/userList'">쇼핑 계속하기</button>
        </section>
    </main>

</body>
</html>
