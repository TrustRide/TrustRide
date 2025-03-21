<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>환불 상세 내역</title>
</head>
<body>

// 사이드바
<jsp:include page="include/sidebar.jsp"/>

<main>
    <!-- ① 선택한 상품 -->
    <section>
        <h3>선택한 상품 <strong>1건</strong></h3>
        <p>로켓와우 새우깡 미니팩, 120g, 1개</p>
        <p>1개 - 2,250 원</p>
    </section>

    <!-- ② 선택한 사유 -->
    <section>
        <h3>선택한 사유</h3>
        <p>상품이 마음에 들지 않음 (단순 변심)</p>
    </section>

    <!-- ③ 환불 안내 -->
    <section>
        <h3>환불 정보를 확인해 주세요</h3>
        <div>
            <h4>환불안내</h4>
            <p>상품금액: 2,250 원</p>
            <p>배송비: 0 원</p>
            <p>반품비: 0 원</p>
        </div>
    </section>

    <!-- ④ 환불 예상금액 -->
    <section>
        <h4>환불 예상금액</h4>
        <p>환불 수단: 우리은행</p>
        <p><strong>2,250 원</strong></p>
    </section>

    <!-- ⑤ 이전 단계 버튼 -->
    <!-- ⑥ 신청하기 버튼 -->
    <section>
        <button>&lt; 이전 단계</button>
        <button>신청하기</button>
    </section>
</main>
</body>
</html>
