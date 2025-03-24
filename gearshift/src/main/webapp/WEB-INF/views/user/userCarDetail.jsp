<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>상품 상세페이지</title>


    <style>
        /* 헤더 스타일 */
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
    </style>



    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fb;
            margin: 0;
            padding: 0;
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
            max-width: 1200px;
            margin: auto;
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

        .footer {
            background-color: #f9f9f9;
            padding: 10px 0;
            color: #333;
            border-top: 1px solid #ddd;
            font-size: 13px;
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
            font-size: 13px;
            line-height: 1.6;
        }

        .container {
            display: flex;
            padding: 30px;
            gap: 30px;
            max-width: 1200px;
            margin: auto;
        }

        .image-section {
            flex: 2;
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .main-image {
            width: 100%;
            border-radius: 10px;
        }

        .thumbnail-container {
            margin-top: 10px;
            display: flex;
            gap: 5px;
            overflow-x: auto;
        }

        .thumbnail-container img {
            height: 60px;
            border-radius: 5px;
            cursor: pointer;
        }

        .info-section {
            flex: 1;
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .badge {
            background-color: red;
            color: white;
            padding: 4px 10px;
            font-size: 12px;
            border-radius: 5px;
            margin-bottom: 10px;
            display: inline-block;
        }

        .car-title {
            font-size: 20px;
            font-weight: bold;
            margin: 10px 0;
        }

        .price-box {
            background: #fafafa;
            padding: 15px;
            border-radius: 10px;
            margin-top: 20px;
            font-size: 16px;
        }

        .price-box div {
            margin-bottom: 10px;
        }

        .total-price {
            font-size: 20px;
            font-weight: bold;
            color: red;
        }

        .button-box {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        .button-box button {
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .visit-btn {
            background-color: orange;
            color: white;
        }

        .home-btn {
            background-color: #f33;
            color: white;
        }

        .description-section {
            max-width: 1200px;
            margin: 30px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .desc-title {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 15px;
        }

        .desc-content {
            font-size: 15px;
            color: #333;
            line-height: 1.7;
        }
    </style>


</head>
<body>

<header>
    <div class="container header-content">
        <div class="logo-container">
            <a href="${pageContext.request.contextPath}"><img src="<c:url value='/resources/img/trustride.png' />" alt="Trust Ride Logo" class="logo-img"></a>
            <h1 class="logo">Trust Ride</h1>
        </div>

        <nav>
            <ul>
                <li><a href="/gearshift/userList">내차사기</a></li>
                <li><a href="${pageContext.request.contextPath}/review">상품리뷰</a></li>
                <%
                  Integer userId = (Integer) session.getAttribute("userId");
                %>
                <%
                    if(userId != null){
                %>
                <li> 박세준님 환영합니다.</li>
                <li><a href="#">마이페이지</a></li>
                <a href="#">로그아웃</a>
                <%
                }else{
                %>
                <a href="${pageContext.request.contextPath}/loginTest">로그인테스트</a>
                <a href="${pageContext.request.contextPath}/login">로그인</a>
                <li><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
                <%
                    }
                %>


            </ul>
        </nav>

        <input type="text" placeholder="🔍차량을 검색하세요." class="search-bar">
    </div>
</header>




<div class="container">
    <div class="image-section">
        <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="Car" class="main-image">
        <div class="thumbnail-container">
            <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="thumb">
            <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="thumb">
            <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="thumb">
            <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="thumb">
            <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="thumb">
        </div>
    </div>

    <div class="info-section">
        <div class="badge">HOT 추천</div>

        <div class="car-title">${carDto.modelName}</div>

        <div>${carDto.manufactureYear}년식 · ${carDto.mileage}km · ${carDto.fuelType}</div>
       <hr>

        <div class="price-box">
            총 구매 예상비용 <hr>

            <div>차량가격: <strong><fmt:formatNumber value="${carDto.carPrice}" type="number" groupingUsed="true" />원</strong></div>
            <div>이전등록비: <strong><fmt:formatNumber value="${carDto.previousRegistrationFee}" type="number" groupingUsed="true" />원</strong></div>
            <div>등록대행수수료: <strong><fmt:formatNumber value="${carDto.agencyFee}" type="number" groupingUsed="true" />원</strong></div>
            <div>배송비: <strong><fmt:formatNumber value="0" type="number" groupingUsed="true" />원</strong></div>




            <div class="total-price">
                총 합계:
                <fmt:formatNumber value="${carDto.carAmountPrice}" type="number" groupingUsed="true" />원
            </div>
        </div>



        <div class="button-box">
            <button class="visit-btn">방문예약신청</button>
            <a href="${pageContext.request.contextPath}/titleHolder?carInfoId=${carDto.carInfoId}"
               class="home-btn"
               style="text-align:center; padding:12px; border-radius:8px; text-decoration:none; color:white; display:block;">
                홈서비스신청
            </a>
        </div>



    </div>
</div>

<div class="description-section">
    <div class="desc-title">현재 보고 계시는 차량의 기본정보를 알려드릴게요</div>
    <div class="desc-content">
        <strong> ${carDto.manufactureYear}</strong>년식 의 주행거리 <strong>${carDto.mileage}km</strong><br>
        배기량 <strong>${carDto.engineCapacity}cc</strong>  연료는 ${carDto.fuelType}, 변속기는 ${carDto.transmission}이고<br>
        색상은 <strong>${carDto.color}</strong> 이에요.
    </div>
</div>

<div class="description-section">
    <div class="desc-title">이 차에는 다음과 같은 특징 및 세부항목이 있습니다.</div>
    <div class="desc-content">

        * Trust Ride에서 신차 구매하여 주기적으로 관리하고 진단까지 마친 차량입니다.<br>
        * Trust Ride의 프리미엄 정비 상품을 이용한 차량으로, 이동정비팀이 정기적으로 철저히 관리했습니다.<br><br>

        ▶ 차량 세부내용<br>
        - 차종:${carDto.modelName} <br>
        - 배기량: ${carDto.engineCapacity}cc<br>
        - 연식: ${carDto.manufactureYear}<br>
        - 색상: ${carDto.color}<br>
        - 주행거리: ${carDto.mileage}<br>
        <hr>
        차량 설명<br>

            ${carDto.description}

        <hr>



        ▶ 영업시간: 월~토요일 (AM 9:00~18:00, 공휴일 휴무)<br>
        ▶ 차량문의<br>
        - 차량위치: 서울 강남구 강남대로 364 (역삼동) 10층<br>
        - 전화: 0000-0000
    </div>
</div>


<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">Trust Ride</div>
        <div class="footer-info">
            <p>
                <img src="<c:url value='/resources/img/trustride.png' />" alt="Trust Ride Logo" class="logo-img">
                상호명 : Trust Ride | 대표자: 패스트캠퍼스 | 개인정보보호책임자: 패스트캠퍼스 | 사업자등록번호: 787-87-00729
            </p>
            <p>통신판매업 신고번호 : 제 2025-서울강남-0562호 | 사업장 소재지 : 서울 강남구 강남대로 364 (역삼동) 10층</p>
        </div>
        <div class="footer-copyright">Copyright © Trust Ride All Rights Reserved</div>
    </div>
</footer>


</body>
</html>
