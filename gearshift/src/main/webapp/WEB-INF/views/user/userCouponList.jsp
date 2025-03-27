<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 쿠폰 목록</title>
    <link href="https://fonts.googleapis.com/css2?family=Pretendard&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Pretendard', sans-serif;
            margin: 0;
            background-color: #f8f9fa;
            display: flex;
        }

        .sidebar {
            width: 220px;
            background-color: #343a40;
            color: white;
            padding: 20px;
            height: 100vh;
            box-sizing: border-box;
            font-weight: 500;
        }

        .sidebar h3 {
            margin-bottom: 30px;
            font-size: 22px;
            font-weight: 600;
        }

        .sidebar h4 {
            margin-top: 20px;
            margin-bottom: 10px;
            font-size: 14px;
            font-weight: 600;
            color: #ced4da;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar a {
            font-size: 14px;
            font-weight: 500;
            color: white;
            text-decoration: none;
            display: block;
            padding: 6px 0;
            transition: background-color 0.2s;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .content {
            flex: 1;
            padding: 40px;
        }

        h2 {
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 16px;
            text-align: center;
            border-bottom: 1px solid #e9ecef;
            font-size: 15px;
        }

        th {
            background-color: #f1f3f5;
            color: #343a40;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background-color: #f8f9fa;
        }

        .status-used {
            color: #adb5bd;
        }

        .status-unused {
            color: #28a745;
            font-weight: bold;
        }

        .use-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .use-button:hover {
            background-color: #0056b3;
        }

        .disabled {
            color: #ced4da;
        }
    </style>
</head>
<body>

<!-- 사이드바 -->
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

<!-- 본문 -->
<div class="content">
    <h2>🎟 내 쿠폰 목록</h2>
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
</div>

</body>
</html>
