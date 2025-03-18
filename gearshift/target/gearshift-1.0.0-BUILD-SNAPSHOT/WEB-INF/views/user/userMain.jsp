
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사용자 메인</title>
    <style>
        /* 헤더 스타일 */
        header {
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }

        /* 전체 컨테이너 */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* 헤더 내부 정렬 */
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* 로고 컨테이너 */
        .logo-container {
            display: flex;
            align-items: center; /* 이미지와 글자 수직 정렬 */
            gap: 8px; /* 이미지와 글자 사이 간격 */
        }

        /* 로고 이미지 스타일 */
        .logo-img {
            height: 100px; /* 이미지 크기 줄이기 */
            width: auto;
        }

        /* 로고 글자 스타일 */
        .logo {
            font-size: 30px; /* 글자 크기 줄이기 */
            font-weight: bold;
            color: red;
            margin: 0;
        }

        /* 네비게이션 스타일 */
        nav ul {
            display: flex;
            list-style: none;
            gap: 20px;
        }

        nav a {
            text-decoration: none;
            color: #555;
            font-size: 16px;
        }

        /* 검색창 스타일 */
        .search-bar {
            padding: 8px 12px;
            border: 1px solid #555;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<header>
    <div class="container header-content">
        <!-- 로고 영역 -->
        <div class="logo-container">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/trustride.png" alt="Trust Ride Logo" class="logo-img"></a>
            <h1 class="logo">Trust Ride</h1>
        </div>

        <!-- 네비게이션 -->
        <nav>
            <ul>
                <li><a href="#">내차사기</a></li>
                <li><a href="#">상품리뷰</a></li>
                <li><a href="#">로그인</a></li>
                <li><a href="#">회원가입</a></li>
            </ul>
        </nav>



        <!-- 검색창 -->
        <input type="text" placeholder="차량을 검색하세요." class="search-bar">
    </div>
</header>




</body>
</html>
