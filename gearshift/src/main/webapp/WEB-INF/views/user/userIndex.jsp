<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
  <c:set var="_csrf" value="${_csrf}" />
</sec:authorize>
<html>
<head>
  <title>회원 메인페이지</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/user/userIndex.css' />">



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
        <li><a href="${pageContext.request.contextPath}/userList">내차사기</a></li>
        <li><a href="${pageContext.request.contextPath}/review">상품리뷰</a></li>

        <c:if test="${not empty sessionScope.loginUser}">
          <li><strong>${sessionScope.loginUser.userName}</strong>님 환영합니다.</li>
          <li><a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a></li>
          <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
        </c:if>

        <c:if test="${empty sessionScope.loginUser}">

          <a href="${pageContext.request.contextPath}/login.do">로그인</a>

          <li><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
        </c:if>
      </ul>
    </nav>



    <form action="/gearshift/searchCar" method="get" style="display: flex; align-items: center;">
      <input type="text" name="searchQuery" placeholder="🔍차량을 검색하세요." class="search-bar" style="padding: 10px; border-radius: 4px; border: 1px solid #ddd; flex: 1;">
      <button type="submit" class="search-btn">검색</button>
    </form>
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
  </div>

  <form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post" style="display:none;">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </form>
</header>



<!-- 중앙에 자동 변경되는 이미지 -->
<div class="image-container">
  <a id="imageLink" href="<c:url value='/userList' />">
    <img id="slideshow" class="slideshow" src="<c:url value='/resources/img/1car1.png' />" alt="슬라이드 이미지">
  </a>
</div>





<a href="/chat">
  <script>
    (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

    ChannelIO('boot', {
      "pluginKey": "c908baf0-72dc-4f83-886e-e07a18a35760"
    });
  </script>
</a>

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

<script>
  // 이미지 및 컨트롤러 링크 배열
  const images = [
    "<c:url value='/resources/img/1car1.png' />",
    "<c:url value='/resources/img/2car2.png' />",
    "<c:url value='/resources/img/3car3.png' />",
    "<c:url value='/resources/img/4car4.png' />",
    "<c:url value='/resources/img/5car5.png' />"
  ];

  const imageLinks = [
    "<c:url value='/userList' />",
    "<c:url value='/userList' />",
    "<c:url value='/userList' />",
    "<c:url value='/userList' />",
    "<c:url value='/userList' />"
  ];


  let currentIndex = 0; // 현재 이미지 인덱스

  function changeImage() {
    currentIndex = (currentIndex + 1) % images.length; // 다음 이미지로 변경
    const imgElement = document.getElementById("slideshow");
    const linkElement = document.getElementById("imageLink");

    imgElement.style.opacity = 0; // 페이드아웃 효과

    setTimeout(() => {
      imgElement.src = images[currentIndex]; // 이미지 변경
      linkElement.href = imageLinks[currentIndex]; // 링크 변경
      imgElement.style.opacity = 1; // 페이드인 효과
    }, 1000); // 1초 후 이미지 변경
  }


  // 5초마다 이미지 변경 실행
  setInterval(changeImage, 5000);

  function logout() {
    document.getElementById('logoutForm').submit();
  }
</script>

</body>
</html>