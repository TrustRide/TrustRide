<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠폰 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>쿠폰 목록</h1>

<!-- 쿠폰 생성 버튼 -->
<a href="${pageContext.request.contextPath}/admin/coupons/create" class="button">새 쿠폰 만들기</a>

<table border="1">
    <tr>
        <th>ID</th>
        <th>쿠폰명</th>
        <th>할인율</th>
        <th>최소 주문 금액</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    <c:if test="${not empty coupons}">
        <c:forEach var="coupon" items="${coupons}">
            <tr>
                <td>${coupon.couponId}</td>
                <td>${coupon.couponName}</td>
                <td>${coupon.discountValue}%</td>
                <td>${coupon.minOrderAmount}원</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/coupons/edit/${coupon.couponId}">수정</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/coupons/delete/${coupon.couponId}"
                       onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
</table>

<!-- 특정 쿠폰을 선택하여 전체 유저에게 발급 -->
<h2>전체 유저에게 쿠폰 발급</h2>
<select id="couponSelect">
    <option value="">쿠폰 선택</option>
    <c:forEach var="coupon" items="${coupons}">
        <option value="${coupon.couponId}">${coupon.couponName}</option>
    </c:forEach>
</select>
<button onclick="issueSelectedCoupon()">선택한 쿠폰 발급</button>

<script>
    function issueSelectedCoupon() {
        let couponId = document.getElementById("couponSelect").value;
        if (!couponId) {
            alert("발급할 쿠폰을 선택하세요.");
            return;
        }

        if (confirm("선택한 쿠폰을 전체 유저에게 발급하시겠습니까?")) {
            fetch('${pageContext.request.contextPath}/admin/coupons/issueSelected?couponId=' + couponId, {
                method: 'POST'
            }).then(response => {
                if (response.ok) {
                    alert("쿠폰이 성공적으로 발급되었습니다!");
                    location.reload();
                } else {
                    alert("쿠폰 발급에 실패했습니다.");
                }
            });
        }
    }
</script>

</body>
</html>
