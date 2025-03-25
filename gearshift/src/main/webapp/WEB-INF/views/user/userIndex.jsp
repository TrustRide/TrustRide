<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>회원 메인페이지</title>

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
      align-items: center;
      gap: 8px; /* 이미지와 글자 사이 간격 */
    }

    /* 로고 이미지 스타일 */
    .logo-img {
      height: 100px;
      width: auto;
    }

    /* 로고 글자 스타일 */
    .logo {
      font-size: 30px;
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

    /* 화면 하단 고정 */
    .footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #f9f9f9;
      padding: 20px 0;
      font-family: Arial, sans-serif;
      color: #333;
      border-top: 1px solid #ddd;
    }

    .footer-container {
      max-width: 1000px;
      margin: 0 auto;
      padding: 0 20px;
    }

    /* 글자를 왼쪽 정렬 */
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

    /* 이미지 크기 조정 및 정렬 */
    .logo-img {
      width: 50px; /* 원하는 크기로 조정 */
      height: auto;
      vertical-align: middle; /* 텍스트와 정렬 */
      margin-right: 10px;
    }

    /* 중앙 이미지 컨테이너 */
    .image-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 80vh;
    }

    /* 슬라이드 이미지 스타일 (크기 조정) */
    .slideshow {
      width: 80vw;
      height: auto;
      max-width: 1000px;
      max-height: 600px;
      object-fit: cover;
      border-radius: 10px;
      transition: opacity 1s ease-in-out;
    }

  </style>

  <style>
    /* 검색 버튼 스타일 */
    .search-btn {
      padding: 10px 15px;
      margin-left: 10px;
      background-color: #ff5722; /* 버튼 배경색 */
      color: white; /* 글자 색 */
      border: none; /* 테두리 없앰 */
      border-radius: 4px; /* 둥근 모서리 */
      cursor: pointer; /* 마우스 커서 변경 */
      font-size: 16px; /* 글자 크기 */
      transition: background-color 0.3s ease; /* 호버 효과 */
    }

    .search-btn:hover {
      background-color: #e64a19; /* 호버 시 버튼 색상 */
    }

    .search-btn:focus {
      outline: none; /* 포커스 시 테두리 제거 */
    }
  </style>


  <style>
    /* 기존 스타일 유지 */

    /* 채팅 아이콘 기본 스타일 */
    .chat-icon {
      position: fixed;
      bottom: 300px; /* 푸터보다 위 */
      right: 23px; /* 우측 정렬 */
      width: 95px; /* 아이콘 크기 */
      height: 100px;
      z-index: 999; /* 다른 요소 위로 올리기 */
      cursor: pointer;
      animation: pulse 2s infinite; /* 자동 강조 애니메이션 추가 */
      transition: filter 0.3s ease-in-out; /* 색상 변경 애니메이션 */
    }

    /* 마우스를 올리면 아이콘이 회색으로 변경 */
    .chat-icon:hover {
      filter: grayscale(80%);
    }

    /* 아이콘이 커졌다가 원래 크기로 돌아오는 애니메이션 */
    @keyframes pulse {
      0% {
        transform: scale(1); /* 기본 크기 */
      }
      50% {
        transform: scale(1.1); /* 20% 확대 */
      }
      100% {
        transform: scale(1); /* 원래 크기 */
      }
    }

    .chat-icon:hover {
      transform: scale(1.1); /* 마우스 올리면 살짝 커짐 */
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
        <li><a href="${pageContext.request.contextPath}/userList">내차사기</a></li>
        <li><a href="${pageContext.request.contextPath}/review">상품리뷰</a></li>


        <c:if test="${not empty sessionScope.loginUser}">
          <li>${sessionScope.loginUser.userName}님 환영합니다.</li>
          <li><a href="#">마이페이지</a></li>
          <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
        </c:if>
        <c:if test="${empty sessionScope.loginUser}">
          <a href="${pageContext.request.contextPath}/login">로그인</a>
          <li><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
        </c:if>

      </ul>
    </nav>


    <form action="/gearshift/searchCar" method="get" style="display: flex; align-items: center;">
      <input type="text" name="searchQuery" placeholder="🔍차량을 검색하세요." class="search-bar" style="padding: 10px; border-radius: 4px; border: 1px solid #ddd; flex: 1;">
      <button type="submit" class="search-btn">검색</button>
    </form>


  </div>
</header>

<!-- 중앙에 자동 변경되는 이미지 -->
<div class="image-container">
  <a id="imageLink" href="<c:url value='/list' />">
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
    "<c:url value='/list' />",
    "<c:url value='/list' />",
    "<c:url value='/list' />",
    "<c:url value='/list' />",
    "<c:url value='/list' />"
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
</script>

</body>
</html>