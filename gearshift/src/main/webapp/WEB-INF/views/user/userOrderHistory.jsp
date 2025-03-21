<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문목록/배송조회</title>
</head>
<body>
// 사이드바
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

    <section>
        <h2>2025. 3. 10 주문</h2>
        <div>
            <p>배송완료: <strong>3/11(화) 도착</strong></p>
            <p>로켓배송 코멧 라벤더 3겹 롤화장지 27m, 12개입, 1개</p>
            <p>5,990 원 - 1개</p>
            <button>배송조회</button>
            <button>교환, 반품 신청</button>
            <button>리뷰 작성하기</button>
        </div>
    </section>
</main>

</body>
</html>

