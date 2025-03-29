<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>내 찜 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 30px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .wishlist-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .car-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: all 0.3s;
            text-align: center;
            padding-bottom: 15px;
        }
        .car-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        .car-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .car-info {
            padding: 15px;
        }
        .car-info h2 {
            font-size: 20px;
            margin: 10px 0 5px;
        }
        .car-info p {
            color: #777;
            font-size: 14px;
            margin: 0 0 10px;
        }
        .car-info .price {
            font-size: 18px;
            font-weight: bold;
            color: #e60023;
        }
        .unwish-form button {
            background: none;
            border: none;
            font-size: 20px;
            color: red;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>

    <link rel="stylesheet" href="<c:url value='/resources/css/user/header.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/footer.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/sidebar.css' />">
</head>
<body>
<%-- 헤더 영역 --%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<%-- 사이드바 --%>
<%@ include file="/WEB-INF/views/user/include/sidebar.jsp" %>


<div class="container">
    <h1>❤️ 내 찜 목록</h1>

    <c:if test="${empty wishlistCars}">
        <p style="text-align: center; font-size: 18px;">찜한 차량이 없습니다.</p>
    </c:if>

    <div class="wishlist-grid">
        <c:forEach var="car" items="${wishlistCars}">
            <div class="car-card">
                <a href="/gearshift/carDetail?carInfoId=${car.carInfoId}">
                    <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="Car Image"/>
                </a>
                <div class="car-info">
                    <h2>${car.modelName}</h2>
                    <p>${car.manufactureYear}년식 · ${car.mileage}km · ${car.fuelType}</p>
                    <p class="price"><fmt:formatNumber value="${car.carPrice}" type="number" />만원</p>

                    <!-- 찜 해제 버튼 -->
                    <form class="unwish-form" method="post" action="${pageContext.request.contextPath}/user/wishlist/remove2">
                        <input type="hidden" name="carInfoId" value="${car.carInfoId}" />
                        <button title="찜 해제">❤️</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/user/footer.css' />">
</body>
</html>
