<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>




<aside class="sidebar">
    <div>
        <h3>주문목록</h3>
    </div>
    <ul>
        <li><h4>MY 쇼핑</h4></li>
        <li><a href="#">주문목록/배송조회</a></li>
        <li><a href="#">취소/반품/교환/환불내역</a></li>
        <li><h4>MY 혜택</h4></li>
        <li><a href="#">할인코드</a></li>
        <li><h4>MY 활동</h4></li>
        <li><a href="#">리뷰관리</a></li>
        <li><a href="#">찜 리스트</a></li>
        <li><h4>MY 정보</h4></li>
        <li><a href="#">개인정보확인/수정</a></li>
    </ul>
</aside>


<table border="1">
    <tr>
        <th>쿠폰ID</th>
        <th>쿠폰명</th>
        <th>할인내용</th>
        <th>발급일</th>
        <th>사용여부</th>
        <th>사용하기</th>
    </tr>
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
                    <c:when test="${coupon.isUsed}">사용완료</c:when>
                    <c:otherwise>미사용</c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:if test="${!coupon.isUsed}">
                    <form action="${pageContext.request.contextPath}/user/coupons/use" method="post">
                        <input type="hidden" name="issuedId" value="${coupon.issuedId}" />
                        <input type="hidden" name="userId" value="${coupon.userId}" />
                        <button type="submit">사용</button>
                    </form>
                </c:if>
                <c:if test="${coupon.isUsed}">-</c:if>
            </td>
        </tr>
    </c:forEach>
</table>
