<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/login.css">
</head>
<body>
    <h2>안녕하세요.<br>True Ride 로그인입니다.</h2>

    <div class="container">
        <div class="tab-menu">
            <div class="tab active" id="personalTab" onclick="switchTab('personal')">개인회원</div>
            <div class="tab" id="adminTab" onclick="switchTab('admin')">관리자</div>
        </div>
        <div class="input-group">
            <input type="text" placeholder="아이디">
        </div>
        <div class="input-group">
            <input type="password" placeholder="비밀번호">
        </div>

        <div class="save-id">
            <input type="checkbox" id="saveId">
            <label for="saveId">아이디 저장</label>
        </div>

        <button class="login-btn">로그인</button>
        <div class="links">
            <a href="#">아이디 찾기</a> |
            <a href="#">비밀번호 찾기</a> |
            <a href="${pageContext.request.contextPath}/register">회원가입</a>
        </div>
        <br>
        <div class="quick-login">
            <p>간편 로그인</p>
            <img src="${pageContext.request.contextPath}/img/login/btn_naver.svg" alt="네이버 로그인">
            <img src="${pageContext.request.contextPath}/img/login/btn_kakao.svg" alt="카카오 로그인">
            <img src="${pageContext.request.contextPath}/img/login/btn_google.svg" alt="구글 로그인">
        </div>
    </div>

    <script>
        const personalTab = document.getElementById('personalTab');
        const adminTab = document.getElementById('adminTab');
        const quickLogin = document.querySelector('.quick-login');
        const links = document.querySelector('.links');

        function switchTab(tab) {
            if (tab === 'personal') {
                personalTab.classList.add('active');
                adminTab.classList.remove('active');
                quickLogin.classList.remove('hidden');
                links.classList.remove('hidden');
            } else {
                personalTab.classList.remove('active');
                adminTab.classList.add('active');
                quickLogin.classList.add('hidden');
                links.classList.add('hidden');
            }
        }
    </script>
</body>
</html>
