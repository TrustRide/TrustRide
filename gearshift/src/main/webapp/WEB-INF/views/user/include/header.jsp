<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ✅ header 전용 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />

<%
  // 현재 URI에서 마이페이지 여부 판단
  String uri = request.getRequestURI();
  boolean isMypage = uri.contains("/user/mypage");
%>

<header>
  <div class="container">
    <div class="logo-container">
      <a href="${pageContext.request.contextPath}/main">
        <img src="${pageContext.request.contextPath}/resources/img/trustride.png" alt="Trust Ride Logo" class="logo-img">
      </a>
      <h1 class="logo">Trust Ride</h1>
    </div>
    <nav>
      <ul>
        <li><a href="${pageContext.request.contextPath}/userList">내차사기</a></li>
        <li><a href="#">상품리뷰</a></li>

        <c:choose>
          <c:when test="${not empty sessionScope.loginUser}">
            <li><strong>${sessionScope.loginUser.userName}</strong>님 환영합니다.</li>
            <li><a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
          </c:when>
          <c:otherwise>
            <li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
            <li><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </nav>

    <% if (!isMypage) { %>
    <form action="${pageContext.request.contextPath}/searchCar" method="get" style="display:flex; align-items:center;">
      <input type="text" name="searchQuery" placeholder="🔍차량을 검색하세요." class="search-bar">
    </form>
    <% } %>
  </div>
</header>
