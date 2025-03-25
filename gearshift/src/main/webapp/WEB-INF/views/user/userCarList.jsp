<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>상품 리스트</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }
        header {
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .logo-img {
            height: 50px;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: red;
        }
        nav ul {
            display: flex;
            list-style: none;
            gap: 20px;
            margin: 10px 0;
        }
        nav a {
            text-decoration: none;
            color: #555;
            font-size: 16px;
        }
        .search-bar {
            padding: 8px 12px;
            border: 1px solid #555;
            border-radius: 4px;
        }
        .banner {
            width: 100%;
            height: 250px;
            background: red;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
        }
        .car-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
        }
        .car-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }
        .car-card img {
            width: 100%;
            height: 230px;
            object-fit: cover;
        }
        .car-card-content {
            padding: 10px;
        }
        .footer {
            background-color: #f9f9f9;
            padding: 20px 0;
            color: #333;
            border-top: 1px solid #ddd;
        }
        .footer-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .footer-logo {
            font-size: 18px;
            font-weight: bold;
            color: red;
        }
        .footer-info, .footer-copyright {
            font-size: 14px;
            line-height: 1.6;
        }
        .category-container {
            position: fixed;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            width: 250px;
            background: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            overflow-y: auto;
            max-height: 80vh;
            z-index: 1000;
        }
        .category-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .category-tier-1, .category-tier-2, .category-tier-3 {
            padding: 10px;
            cursor: pointer;
        }
        .category-tier-1 {
            font-weight: bold;
            background-color: #f8f8f8;
            border-radius: 5px;
            margin-bottom: 5px;
            text-align: center;
        }
        .category-tier-2 {
            border-left: 3px solid #ddd;
            padding-left: 15px;
        }
        .category-tier-3 {
            color: #666;
            border-left: 3px solid #ccc;
            padding-left: 25px;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<header>
    <div class="container header-content">
        <div class="logo-container">
            <a href="/gearshift/main"><img src="<c:url value='/resources/img/trustride.png' />" alt="Trust Ride Logo" class="logo-img"></a>
            <h1 class="logo">Trust Ride</h1>
        </div>
        <nav>
            <ul>
                <li><a href="/gearshift/userList">내차사기</a></li>
                <li><a href="#">상품리뷰</a></li>
                <%
                    String userId = String.valueOf(session.getAttribute("userId"));
                    if(userId != null){
                %>
                <li><strong><%= userId %></strong>님 환영합니다.</li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">로그아웃</a></li>
                <%
                } else {
                %>
                <li><a href="/gearshift/login">로그인</a></li>
                <li><a href="#">회원가입</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <input type="text" placeholder="🔍차량을 검색하세요." class="search-bar">
    </div>
</header>

<section class="banner">
    내 차 20만원 할인 받는 법!
</section>

<section class="car-section">
    <h2>홈서비스 타임딜</h2>
    <div class="car-grid">
        <c:forEach var="car" items="${userCarList}">
            <a href="/gearshift/carDetail?carInfoId=${car.carInfoId}" class="car-card">

                <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="Car Image">
                <div class="car-card-content">
                    <h2>${car.modelName}</h2>
                    <h4>${car.manufactureYear}년식 · ${car.mileage}km · ${car.fuelType}</h4>
                    <h1><fmt:formatNumber value="${car.carPrice}" type="number" />만원</h1>
                </div>
            </a>
        </c:forEach>
    </div>
</section>

<div class="category-container">
    <h2>국산·수입 제조사/모델</h2>
    <ul class="category-list">
        <c:forEach var="cate" items="${cateList}">
            <c:choose>
                <c:when test="${cate.tier == 1}">
                    <li class="category-tier-1" onclick="toggleCategory('tier2-${cate.cateCode}')">${cate.cateName}</li>
                    <ul id="tier2-${cate.cateCode}" class="hidden category-list"></ul>
                </c:when>
                <c:when test="${cate.tier == 2}">
                    <c:set var="parentId" value="tier2-${cate.cateParent}" />
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            var parentElement = document.getElementById("${parentId}");
                            if (parentElement) {
                                parentElement.innerHTML += '<li class="category-tier-2" onclick="toggleCategory(\'tier3-${cate.cateCode}\')">${cate.cateName}</li>' + '<ul id="tier3-${cate.cateCode}" class="hidden category-list"></ul>';
                            }
                        });
                    </script>
                </c:when>
                <c:when test="${cate.tier == 3}">
                    <c:set var="parentId" value="tier3-${cate.cateParent}" />
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            var parentElement = document.getElementById("${parentId}");
                            if (parentElement) {
                                parentElement.innerHTML += '<li class="category-tier-3">${cate.cateName}</li>';
                            }
                        });
                    </script>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</div>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">Trust Ride</div>
        <div class="footer-info">
            <p>상호명 : Trust Ride | 대표자: 패스트캠퍼스 | 사업자등록번호: 787-87-00729</p>
            <p>통신판매업 신고번호 : 제 2025-서울강남-0562호 | 사업장 소재지 : 서울 강남구 강남대로 364 (역삼동) 10층</p>
        </div>
        <div class="footer-copyright">Copyright © Trust Ride All Rights Reserved</div>
    </div>
</footer>

<script>

    function toggleCategory(id) {
        var element = document.getElementById(id);
        if (element) {
            element.classList.toggle("hidden");
        }
    }

</script>
</body>
</html>