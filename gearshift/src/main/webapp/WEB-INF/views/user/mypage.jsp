<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <title>마이페이지</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- CDN 폰트/스타일 -->
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- 내부 css 경로 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/sidebar.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
</head>

<body class="w3-content">

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
            <li><a href="/gearshift">마이페이지</a></li>
            <li><a href="/gearshift/logout">로그아웃</a></li>
          </c:when>
        </c:choose>
      </ul>
    </nav>

    <input type="text" placeholder="🔍차량을 검색하세요." class="search-bar">
  </div>
</header>

<jsp:include page="include/header.jsp" />


<!-- ✅ 사이드바 -->
<jsp:include page="include/sidebar.jsp" />

<!-- ✅ 본문 -->
<div class="w3-main">
  <div class="content-box">
    <h2>마이페이지 본문 영역입니다</h2>
    <p>여기에 마이페이지 관련 내용이 들어갑니다.</p>
  </div>
</div>

<!-- ✅ 푸터 -->
<jsp:include page="include/footer.jsp" />

</body>
</html>
