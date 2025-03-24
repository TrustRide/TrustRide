<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>상품 리스트</title>
    <style>
        /* ✅ 전체 페이지 레이아웃 설정 */
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        /* ✅ 전체 컨테이너 */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* ✅ 헤더 스타일 */
        header {
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
            text-align: center;
        }

        /* ✅ 헤더 내부 정렬 */
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* ✅ 로고 스타일 */
        .logo-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo-img {
            height: 50px;
            width: auto;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: red;
        }

        /* ✅ 네비게이션 */
        nav ul {
            display: flex;
            align-items: center;
            list-style: none;
            gap: 20px;
            padding: 0;
            margin: 10px 0;
        }

        nav a {
            text-decoration: none;
            color: #555;
            font-size: 16px;
        }

        /* ✅ 검색창 스타일 */
        .search-bar {
            padding: 8px 12px;
            border: 1px solid #555;
            border-radius: 4px;
        }

        /* ✅ 차량 목록 3x3 그리드 레이아웃 */
        .car-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3열 */
            gap: 20px;
            justify-content: center;
            align-items: stretch;
            padding: 20px;
        }

        /* ✅ 차량 카드 스타일 */
        .car-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            padding-bottom: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
            cursor: pointer;
        }

        .car-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* ✅ 차량 이미지 크기 조정 */
        .car-card img {
            width: 100%;
            height: 230px;
            object-fit: cover;
            border-radius: 5px;
        }

        /* ✅ 카드 내용 스타일 */
        .car-card-content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 10px;
        }

        /* ✅ 링크 색상 검정으로 변경 */
        .car-card a {
            color: black;
            text-decoration: none; /* 밑줄 제거 */
        }

        .car-card a:hover {
            color: black;
            text-decoration: underline; /* 마우스 올리면 밑줄 추가 */
        }

        /* ✅ 반응형 설정 */
        @media (max-width: 900px) {
            .car-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {
            .car-grid {
                grid-template-columns: repeat(1, 1fr);
            }
        }

        /* ✅ 푸터 스타일 */
        .footer {
            position: relative;
            width: 100%;
            background-color: #f9f9f9;
            padding: 20px 0;
            font-family: Arial, sans-serif;
            color: #333;
            border-top: 1px solid #ddd;
            margin-top: auto;
        }

        .footer-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .footer-logo {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
            color: red;
        }

        .footer-info {
            font-size: 14px;
            line-height: 1.6;
            text-align: left;
        }

        .footer-copyright {
            font-size: 12px;
            color: #777;
            margin-top: 10px;
            text-align: left;
        }
        h2{
            color: #222222;
        }
    </style>

    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }



        .category-container {
            position: fixed;
            left: 20px;  /* 좌측 정렬 */
            top: 50%;  /* 화면 세로 중앙 정렬 */
            transform: translateY(-50%);  /* 정확한 중앙 정렬 */
            width: 250px;
            background: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            font-size: 14px;
            z-index: 1000;
            max-height: 80vh; /* 너무 길어지지 않도록 제한 */
            overflow-y: auto; /* 스크롤 추가 */
        }


        /* 카테고리 제목 스타일 */
        .category-container h2 {
            font-size: 18px;
            color: #333;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }


        .category-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }


        .category-tier-1 {
            font-size: 16px;
            font-weight: bold;
            padding: 12px;
            background-color: #f8f8f8;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 5px;
            text-align: center;
            transition: background 0.3s;
        }
        .category-tier-1:hover {
            background-color: #e8e8e8;
        }



        .category-tier-2 {
            font-size: 14px;
            padding: 10px 15px;
            background-color: #fff;
            border-left: 3px solid #ddd;
            cursor: pointer;
            transition: background 0.3s;
        }
        .category-tier-2:hover {
            background-color: #f0f0f0;
        }



        .category-tier-3 {
            font-size: 13px;
            padding: 8px 25px;
            color: #666;
            border-left: 3px solid #ccc;
        }


        .category-list input[type="checkbox"] {
            margin-right: 6px;
            cursor: pointer;
        }


        .category-count {
            float: right;
            color: #888;
            font-size: 12px;
        }


        .hidden {
            display: none;
        }

        /* 배너 */
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
                    String userId=(String) session.getAttribute("userId");
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
                <a href="/gearshift/login">로그인</a>
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
        <a href="/gearshift/detail1" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차1.png" alt="Car Image">
            <div class="car-card-content">
                <h2>더 올뉴G80 가솔린 2.5 AWD 기본형</h2>
                <h4>2021년식 · 23,472km · 디젤</h4>
                <h1>3,800만원</h1>
            </div>
        </a>

        <a href="/gearshift/detail2" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차2.png" alt="Car Image">
            <div class="car-card-content">
                <h2>기아 스포티지 4세대 디젤</h2>
                <h4>2021년식 · 13,472km · 디젤</h4>
                <h1>3,200만원</h1>
            </div>
        </a>

        <a href="/gearshift/detail3" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차3.png" alt="Car Image">
            <div class="car-card-content">
                <h2>카니발 하이리무진</h2>
                <h4>2021년식 · 13,472km · 디젤</h4>
                <h1>4,200만원</h1>
            </div>
        </a>
    </div>
</section>

<section class="car-section">

    <div class="car-grid">
        <a href="/gearshift/detail1" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차4.png" alt="Car Image">
            <div class="car-card-content">
                <h2>더 올뉴G80 가솔린 2.5 AWD 기본형</h2>
                <h4>2021년식 · 23,472km · 디젤</h4>
                <h1>3,800만원</h1>
            </div>
        </a>

        <a href="/gearshift/detail2" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차5.png" alt="Car Image">
            <div class="car-card-content">
                <h2>기아 스포티지 4세대 디젤</h2>
                <h4>2021년식 · 13,472km · 디젤</h4>
                <h1>3,200만원</h1>
            </div>
        </a>

        <a href="/gearshift/detail3" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차6.png" alt="Car Image">
            <div class="car-card-content">
                <h2>카니발 하이리무진</h2>
                <h4>2021년식 · 13,472km · 디젤</h4>
                <h1>4,200만원</h1>
            </div>
        </a>
    </div>
</section>

<br>

<section class="car-section">

    <div class="car-grid">
        <a href="/gearshift/detail1" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="Car Image">
            <div class="car-card-content">
                <h2>더 올뉴G80 가솔린 2.5 AWD 기본형</h2>
                <h4>2021년식 · 23,472km · 디젤</h4>
                <h1>3,800만원</h1>
            </div>
        </a>

        <a href="/gearshift/detail2" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차8.png" alt="Car Image">
            <div class="car-card-content">
                <h2>기아 스포티지 4세대 디젤</h2>
                <h4>2021년식 · 13,472km · 디젤</h4>
                <h1>3,200만원</h1>
            </div>
        </a>

        <a href="/gearshift/detail3" class="car-card">
            <img src="${pageContext.request.contextPath}/resources/img/자동차9.png" alt="Car Image">
            <div class="car-card-content">
                <h2>카니발 하이리무진</h2>
                <h4>2021년식 · 13,472km · 디젤</h4>
                <h1>4,200만원</h1>
            </div>
        </a>
    </div>
</section>

<div class="category-container">
    <h2>국산·수입 제조사/모델</h2>
    <ul class="category-list">
        <c:forEach var="cate" items="${cateList}">
            <c:choose>

                <c:when test="${cate.tier == 1}">
                    <li class="category-tier-1" onclick="toggleCategory('tier2-${cate.cateCode}')">
                            ${cate.cateName}
                    </li>
                    <ul id="tier2-${cate.cateCode}" class="hidden category-list"></ul>
                </c:when>

                <c:when test="${cate.tier == 2}">
                    <c:set var="parentId" value="tier2-${cate.cateParent}" />
                    <script>
                        var parentElement = document.getElementById("${parentId}");
                        if (parentElement) {
                            parentElement.innerHTML +=
                                '<li class="category-tier-2" onclick="toggleCategory(\'tier3-${cate.cateCode}\')">${cate.cateName}</li>' +
                                '<ul id="tier3-${cate.cateCode}" class="hidden category-list"></ul>';
                        }
                    </script>
                </c:when>


                <c:when test="${cate.tier == 3}">
                    <c:set var="parentId" value="tier3-${cate.cateParent}" />
                    <script>
                        var parentElement = document.getElementById("${parentId}");
                        if (parentElement) {
                            parentElement.innerHTML +=
                                '<li class="category-tier-3">${cate.cateName}</li>';
                        }
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
    $(document).ready(function(){
        console.log('${cateList}');
    });
</script>


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