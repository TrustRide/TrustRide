<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>개인정보확인/수정</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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

        .w3-main {
            margin-left: 250px;
            margin-top: 60px;
        }

        .content-box {
            padding: 40px;
        }

        form {
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #ccc;
            width: 350px;
        }

        label {
            display: inline-block;
            width: 140px;
            margin-bottom: 8px;
        }

        input {
            width: 180px;
            padding: 5px;
        }

        button {
            margin-top: 10px;
            padding: 6px 14px;
        }

        #profileForm, #deleteForm, #newPasswordRow {
            display: none;
        }
    </style>



    <script>
        function checkPassword() {
            const password = document.getElementById("checkPassword").value;
            fetch("${pageContext.request.contextPath}/user/userForm/check-password", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify({password: password})
            })
                .then(res => res.json())
                .then(data => {
                    if (data.verified) {
                        alert("비밀번호 확인 완료");
                        document.getElementById("passwordCheckArea").style.display = "none";
                        document.getElementById("profileForm").style.display = "block";
                        document.getElementById("deleteForm").style.display = "block";
                        document.getElementById("newPasswordRow").style.display = "block";
                        document.getElementById("currentPassword").value = password;
                        document.getElementById("currentPasswordDel").value = password;
                    } else {
                        alert("비밀번호가 일치하지 않습니다.");
                    }
                });
        }
    </script>

</head>

<body class="w3-content" style="max-width:1200px">

<!-- 헤더 -->
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

                <c:choose><<<<<<< Updated upstream
                    <c:when test="${not empty sessionScope.loginUser}">
                        <li><strong>${sessionScope.loginUser.userName}</strong>님 환영합니다.</li>
                        <li><a href="/gearshift/user/mypage">마이페이지</a></li>
                        <li><a href="/gearshift/logout">로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/gearshift/login">로그인</a></li>
                        <li><a href="/gearshift/register">회원가입</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
        <input type="text" placeholder="🔍차량을 검색하세요." class="search-bar">
    </div>
</header>

<!-- 사이드바 -->
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

<!-- 본문: 회원정보 수정 -->
<div class="w3-main">
    <div class="content-box">
        <h2>회원 프로필</h2>

        <div id="passwordCheckArea">
            <label>비밀번호:</label>
            <input type="password" id="checkPassword" />
            <button onclick="checkPassword()">확인</button>
        </div>

        <form id="profileForm" action="${pageContext.request.contextPath}/user/userForm/update" method="post">
            <input type="hidden" name="userId" value="${user.userId}" />
            <input type="hidden" name="currentPassword" id="currentPassword" />

            <label>고객명:</label>
            <input type="text" name="userName" value="${user.userName}" readonly /><br/>

            <label>이메일:</label>
            <input type="email" name="userEmail" value="${user.userEmail}" /><br/>

            <label>연락처:</label>
            <input type="text" name="userPhoneNumber" value="${user.userPhoneNumber}" /><br/>

            <div id="newPasswordRow">
                <label>새 비밀번호:</label>
                <input type="password" name="userPassword" /><br/>
            </div>

            <button type="submit">변경하기</button>
        </form>

        <form id="deleteForm" action="${pageContext.request.contextPath}/user/userForm/delete" method="post"
              onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
            <input type="hidden" name="currentPassword" id="currentPasswordDel" />
            <button type="submit" style="background-color:#f44336; color:white;">탈퇴하기</button>
        </form>
    </div>
</div>


</body>
</html>
