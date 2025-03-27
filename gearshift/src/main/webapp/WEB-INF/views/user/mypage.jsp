<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <title>마이페이지</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- W3.CSS 및 아이콘/폰트 설정 -->
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
    body, h1, h2, h3, h4, h5, h6, .w3-wide {
      font-family: "Montserrat", sans-serif;
      margin: 0;
      padding: 0;
    }

    /* ✅ 헤더 */
    header {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 60px;
      background: white;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      z-index: 1000;
      display: flex;
      align-items: center;
    }

    .container {
      width: 90%;
      max-width: 1200px;
      margin: 0 auto;
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
      height: 40px;
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
      margin: 0;
      padding: 0;
    }

    nav a {
      text-decoration: none;
      color: #555;
      font-size: 16px;
    }

    .search-bar {
      padding: 6px 10px;
      border: 1px solid #555;
      border-radius: 4px;
    }

    /* ✅ 사이드바 원래 스타일 유지 */
    .mypage-section-title {
      padding: 12px 16px;
      font-weight: bold;
      background: #f1f1f1;
    }

    .mypage-link {
      padding: 8px 16px;
      display: block;
      color: #333;
      text-decoration: none;
    }

    .mypage-link:hover {
      background-color: #ddd;
    }

    nav.w3-sidebar {
      top: 60px !important;
      height: calc(100% - 60px);
    }

    /* ✅ 본문 여백 처리 */
    .w3-main {
      margin-left: 250px;
      margin-top: 60px;
    }

    .content-box {
      padding: 40px;
    }
  </style>
</head>

<body class="w3-content" style="max-width:1200px">

<!-- ✅ 헤더 -->
<header>
  <div class="container">
    <div class="logo-container">
      <a href="/gearshift/main"><img src="/gearshift/resources/img/trustride.png" alt="Trust Ride Logo" class="logo-img"></a>
      <h1 class="logo">Trust Ride</h1>
    </div>
    <nav>
      <ul>
        <li><a href="/gearshift/userList">내차사기</a></li>
        <li><a href="#">상품리뷰</a></li>

        <c:choose>
          <c:when test="${not empty sessionScope.loginUser}">
            <li><strong>${sessionScope.loginUser.userName}</strong>님 환영합니다.</li>
            <li><a href="/gearshift/user/mypage">마이페이지</a></li>
            <li><a href="/gearshift/logout">로그아웃</a></li>
          </c:when>
        </c:choose>
      </ul>
    </nav>

    <input type="text" placeholder="🔍차량을 검색하세요." class="search-bar">
  </div>
</header>

<!-- ✅ 사이드바 -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px;" id="mySidebar">
  <div class="w3-container w3-padding-16">
    <h3 class="w3-wide"><b>MY PAGE</b></h3>
  </div>

  <div class="mypage-section">
    <div class="mypage-section-title">MY 쇼핑</div>
    <a href="/gearshift/user/orderList" class="mypage-link">주문목록/배송조회</a>
    <a href="#" class="mypage-link">취소/반품/교환/환불내역</a>
  </div>

  <div class="mypage-section">
    <div class="mypage-section-title">MY 혜택</div>
    <a href="#" class="mypage-link">할인쿠폰</a>
  </div>

  <div class="mypage-section">
    <div class="mypage-section-title">MY 활동</div>
    <a href="/gearshift/user/inquiry" class="mypage-link">문의하기</a>
    <a href="#" class="mypage-link">리뷰관리</a>
    <a href="#" class="mypage-link">찜 리스트</a>
  </div>

  <div class="mypage-section">
    <div class="mypage-section-title">MY 정보</div>
    <a href="/gearshift/user/userForm" class="mypage-link">개인정보확인/수정</a>
  </div>
</nav>

<!-- ✅ 본문 영역 -->
<div class="w3-main">
  <div class="content-box">
    <h2>마이페이지 본문 영역입니다</h2>
    <p>여기에 마이페이지 관련 내용이 들어갑니다.</p>
  </div>
</div>

</body>
</html>
