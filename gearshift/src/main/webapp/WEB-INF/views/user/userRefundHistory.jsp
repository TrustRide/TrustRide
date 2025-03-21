<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>취소신청</title>
</head>
<body>

// 사이드바
<jsp:include page="include/sidebar.jsp"/>

<main>
    <!-- ① 상품 선택 영역 -->
    <section>
        <h3>상품을 선택해 주세요</h3>
        <label>
            <input type="checkbox"> 새우깡 미니팩, 120g, 1개
        </label>
    </section>

    <!-- ② 취소 사유 선택 영역 -->
    <section>
        <h3>취소 사유를 선택해 주세요</h3>
        <label><input type="radio" name="reason"> 배송지를 잘못 입력함</label><br>
        <label><input type="radio" name="reason"> 상품이 마음에 들지 않음 (단순 변심)</label><br>
        <label><input type="radio" name="reason"> 다른 상품 추가 후 재주문 예정</label>
    </section>



    <section>
        <!-- ③ 이전 단계 버튼 -->
        <button>&lt; 이전 단계</button>

        <!-- ④ 다음 단계 버튼 -->
        <button>다음 단계 &gt;</button>
    </section>
</main>
</body>
</html>

