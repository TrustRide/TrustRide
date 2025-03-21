
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String title = request.getParameter("title");
    if (title == null) {
        title = "명의를 선택해 주세요.";  // 기본 메시지
    }
%>
<html>
<head>
    <title>배송지 입력</title>

    <style>
        /* ----- 전체 페이지 기본 설정 ----- */
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* 화면 최소 높이 설정 (전체 화면을 채우도록) */
        }

        /* 헤더 스타일 */
        header {
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
            width: 100%;
        }

        /* 헤더 내부 정렬 */
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* 로고 컨테이너 */
        .logo-container {
            display: flex;
            align-items: center;
            gap: 8px; /* 이미지와 글자 사이 간격 */
        }

        /* 로고 이미지 스타일 */
        .logo-img {
            height: 50px;
            width: auto;
        }

        /* 로고 글자 스타일 */
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: red;
            margin: 0;
        }

        /* 네비게이션 스타일 */
        nav ul {
            display: flex;
            list-style: none;
            gap: 20px;
            align-items: center;
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

        /* ----- 메인 콘텐츠 (Form + Summary) ----- */
        .container {
            display: flex;
            justify-content: space-between;
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            flex: 1;
        }

        /* 왼쪽 입력 폼 */
        .form-section {
            width: 65%;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* 오른쪽 요약 정보 */
        .summary-section {
            width: 30%;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* ----- 푸터 스타일 수정 ----- */
        .footer {
            width: 100%;
            background-color: #f9f9f9;
            padding: 20px 0;
            font-family: Arial, sans-serif;
            color: #333;
            border-top: 1px solid #ddd;
            min-height: 120px; /* 푸터 고정 크기 */
            margin-top: auto;
        }

        .footer-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            flex-direction: column;
        }

        /* 푸터 글자 정렬 */
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

        /* ----- 반응형 레이아웃 (모바일 대응) ----- */
        @media (max-width: 1024px) {
            .container {
                flex-direction: column;
            }

            .form-section,
            .summary-section {
                width: 100%;
                margin-bottom: 20px;
            }
        }

        h2 {
            font-size: 22px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 5px;
        }

        p {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 20px;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
        }

        .input-group {
            display: flex;
            gap: 10px;
        }

        .input-group input {
            width: 48%;
        }

        .address_wrap {
            margin-top: 20px;
        }

        .address_button {
            background: white;
            border: 1px solid #ccc;
            padding: 12px 15px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            text-align: center;
            margin-top: 5px;
        }

        .submit-btn {
            background: #c00;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 30px;
            font-size: 16px;
        }


    </style>

    <style>
        .order-box {
            width: 100%;
            max-width: 350px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }


        .order-box img {
            width: 100%;
            max-width: 320px;
            height: auto;
            border-radius: 5px;
            margin-bottom: 15px;
        }



        .info-buttons {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 가로 2개씩 배치 */
            gap: 10px; /* 버튼 사이 여백 */
            justify-content: center;
            margin-top: 15px;
        }


        .info-button {
            padding: 15px 10px;
            border: 1px solid #ddd;
            background: white;
            border-radius: 12px; /* 둥근 모서리 */
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            transition: all 0.2s ease-in-out;
            font-weight: bold;
        }

        .info-button:hover {
            background: #f1f1f1;
        }


        .price-box {
            font-size: 22px;
            color: red;
            font-weight: bold;
            margin-top: 10px;
            text-align: right;
        }
    </style>

    <style>
        /* 🚗 면허 정보 입력 2x2 레이아웃 */
        .license-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 2열 배치 */
            gap: 15px; /* 입력 필드 간 간격 */
            margin-bottom: 20px;
        }

        .license-field {
            display: flex;
            flex-direction: column;
        }

        .license-field label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .license-field input,
        .license-field select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
        }
    </style>

    <style>
        /* 모달 스타일 */
        .modal {
            display: none; /* 기본적으로 숨김 */
            position: fixed;
            z-index: 1000;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 300px;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            padding: 20px;
            text-align: center;
            border-radius: 10px;
        }

        .modal-content {
            position: relative;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 18px;
            cursor: pointer;
        }

        .confirm-button {
            width: 100%;
            background-color: darkred;

            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .confirm-button:hover {
            background-color: darkred;
        }
    </style>

    <style>
        /* ✅ 약관 동의 박스 스타일 */
        .terms-container {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .terms-main {
            font-size: 13px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .terms-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .terms-box:last-child {
            border-bottom: none;
        }

        .terms-box label {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 13px;
        }

        .terms-box a {
            color: darkred;
            text-decoration: none;
            font-size: 13px;
        }

        .terms-box a:hover {
            text-decoration: underline;
        }
    </style>

    <style>
        .modal {
            display: none; /* 기본적으로 숨김 */
            position: fixed;
            z-index: 1000;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            padding: 20px;
            text-align: left;
            border-radius: 10px;
            overflow: hidden;
        }

        /* ✅ 모달 내부 스타일 */
        .modal-content {
            position: relative;
            padding: 20px;
        }

        /* ✅ 닫기 버튼 스타일 */
        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 22px;
            cursor: pointer;
        }

        /* ✅ 확인 버튼 스타일 */
        .confirm-button {
            width: 100%;
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .confirm-button:hover {
            background-color: #a00;
        }
    </style>


    <style>
        /* ✅ 약관 동의 박스 스타일 */
        .terms-container {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .terms-main {
            font-size: 18px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .terms-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .terms-box:last-child {
            border-bottom: none;
        }

        .terms-box label {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 16px;
        }

        .terms-box a {
            color: darkred;
            text-decoration: none;
            font-size: 14px;
        }

        .terms-box a:hover {
            text-decoration: underline;
        }

        /* ✅ 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 600px;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            padding: 20px;
            text-align: left;
            border-radius: 10px;
        }

        .modal-content {
            position: relative;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 22px;
            cursor: pointer;
        }

        .confirm-button {
            width: 100%;
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .confirm-button:hover {
            background-color: #a00;
        }

        /* ✅ 테이블 스타일 */
        .terms-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .terms-table th, .terms-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .terms-table th {
            background: #f4f4f4;
            font-weight: bold;
        }
    </style>

    <style>
        /* ✅ 약관 동의 박스 스타일 */
        .terms-container {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .terms-main {
            font-size: 18px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .terms-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .terms-box:last-child {
            border-bottom: none;
        }

        .terms-box label {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 16px;
        }

        .terms-box a {
            color: darkred;
            text-decoration: none;
            font-size: 14px;
        }

        .terms-box a:hover {
            text-decoration: underline;
        }

        /* ✅ 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 600px;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            padding: 20px;
            text-align: left;
            border-radius: 10px;
        }

        .modal-content {
            position: relative;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 22px;
            cursor: pointer;
        }

        .confirm-button {
            width: 100%;
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .confirm-button:hover {
            background-color: #a00;
        }

        /* ✅ 테이블 스타일 */
        .terms-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .terms-table th, .terms-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .terms-table th {
            background: #f4f4f4;
            font-weight: bold;
        }
    </style>

    <style>
        /* ✅ 테이블 스타일 */
        .terms-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .terms-table th, .terms-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .terms-table th {
            background: #f4f4f4;
            font-weight: bold;
        }

        /* ✅ 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 600px;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            padding: 20px;
            text-align: left;
            border-radius: 10px;
        }

        .modal-content {
            position: relative;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 22px;
            cursor: pointer;
        }

        .confirm-button {
            width: 100%;
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .confirm-button:hover {
            background-color: #a00;
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

<div class="container">
    <!-- 왼쪽 폼 섹션 -->
    <div class="form-section">
        <h2><%= title %></h2> <!-- 선택한 버튼에 따라 제목 변경됨 -->
        <p>이제 명의자 정보와 배송 정보를 입력해 주세요.</p>
        <form action="/gearshift/deliveryInsert" method="post">
            <input type="hidden" name="userId" value="${userDto.userId}">

            <label>명의자 이름</label>
            <input type="text" name="userName" value="${userDto.userName}" readonly>

            <label>명의자 휴대폰 번호</label>
            <input type="text" name="userPhoneNumber" value="${userDto.userPhoneNumber}" readonly>

            <label>명의자 주민등록번호</label>
            <input type="text" id="memberResident" name="memberResident" placeholder="13자리 입력" maxlength="13">




            <div class="address_wrap">
                <label>명의자 주민등록 주소지</label>
                <input type="text" name="memberAddr1" readonly placeholder="우편번호">
                <button type="button" class="address_button" onclick="execution_daum_address()">우편번호 찾기</button>
                <input type="text" name="memberAddr2" readonly placeholder="도로명 주소 또는 지번 주소">
                <input type="text" name="memberAddr3" placeholder="상세주소 입력">
            </div>


            <label for="deliveryDate">희망 배송일</label>
            <input type="date" id="deliveryDate" name="deliveryDate" min="">





            <!-- 면허 종류 선택 -->
            <h3>면허 정보 입력</h3>
            <div class="license-grid">
                <!-- 면허 종류 선택 -->
                <div class="license-field">
                    <label for="memberLicense">면허 종류</label>
                    <select id="memberLicense" name="memberLicense">
                        <option value="">면허 종류 선택</option>
                        <option value="1종 보통">1종 보통</option>
                        <option value="1종 대형">1종 대형</option>
                        <option value="2종 보통">2종 보통</option>
                        <option value="2종 소형">2종 소형</option>
                    </select>
                </div>

                <!-- 면허 번호 입력 -->
                <div class="license-field">
                    <label for="licenseNumber">면허 번호</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" placeholder="예: 12-34-567890">
                </div>

                <!-- 면허 발급일 선택 -->
                <div class="license-field">
                    <label for="licenseIssuedDate">면허 발급일</label>
                    <input type="date" id="licenseIssuedDate" name="licenseIssuedDate" onchange="setLicenseExpiryDate()">
                </div>

                <!-- 면허 만료일 (자동 계산) -->
                <div class="license-field">
                    <label for="licenseExpiryDate">면허 만료일</label>
                    <input type="date" id="licenseExpiryDate" name="licenseExpiryDate" readonly>
                </div>
            </div>


            <div class="terms-container">
                <h3>약관 동의</h3>

                <!-- 전체 동의 -->
                <label class="terms-main">
                    <input type="checkbox" id="allAgree" onclick="toggleAllCheckboxes(this)"> <strong>전체 동의하기</strong>
                </label>

                <!-- 개별 약관 -->
                <div class="terms-box">
                    <label><input type="checkbox" class="terms-checkbox" required> 개인정보 수집/이용 동의 (필수)</label>
                    <a href="#" onclick="openTermsModal()">보기</a>
                </div>

                <div class="terms-box">
                    <label><input type="checkbox" class="terms-checkbox"> 개인정보 제3자 제공/이용 동의 (선택)</label>
                    <a href="#" onclick="openThirdPartyModal()">보기</a>
                </div>

                <div class="terms-box">
                    <label>
                        <input type="checkbox" class="terms-checkbox" required> 고유식별정보 수집/이용 동의 (필수)
                    </label>
                    <a href="#" onclick="openIdentificationModal()">보기</a>
                </div>

                <div class="terms-box">
                    <label><input type="checkbox" class="terms-checkbox"> 맞춤 서비스 제공 등 혜택/정보 수신 동의 (선택)</label>
                    <a href="#" onclick="openBenefitModal()">보기</a>
                </div>
            </div>
            <!-- 다음 버튼 -->
            <button type="submit" class="submit-btn">다음</button>
        </form>
    </div>


<div class="summary-section">
    <div class="order-box">
        <img src="<c:url value='/resources/img/3car3.png' />" alt="Trust Ride Logo" class="logo-img">
        <h3>기아 K3 트렌디</h3>
        <p>43다5558 | 13년 12월식 (14년형) · 87,121km · 가솔린</p>

        <div class="info-buttons">
            <button class="info-button">차량옵션</button>
            <button class="info-button">성능·상태 점검기록부</button>
            <button class="info-button">Trust Ride 진단서</button>
            <button class="info-button">보험이력조회</button>
        </div>

        <hr>

        <div class="price-box">7,720,000원</div>


    </div>
</div>
</div>



<div id="errorModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <p id="errorMessage">모든 필수 정보를 입력해 주세요.</p>
        <button class="confirm-button" onclick="closeModal()">확인</button>
    </div>
</div>

<!-- 개인정보 수집/이용 동의 모달 -->
<div id="termsModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeTermsModal()">&times;</span>
        <h2>[필수] 개인정보 수집/이용 동의</h2>
        <p><strong>개인정보수집동의</strong></p>
        <p>
            - Trust Ride는 매매계약 체결과 관련하여 아래와 같은 개인의 정보를 수집 및 이용하고자 하오니 동의하여 주시기 바랍니다.
            *계약 체결을 위한 필수적 동의입니다.
        </p>

        <p><strong>- 수집항목:</strong></p>
        <ul>
            <li><strong>[개인]:</strong> 이름, 휴대전화번호, 주소, 주민등록번호, 배송지 정보 등</li>
            <li><strong>[개인사업자]:</strong> 명의자 이름, 휴대전화번호, 주소, 사업자등록번호, 사업장 주소</li>
            <li><strong>[법인사업자]:</strong> 법인 이름, 휴대전화번호, 법인등록번호, 사업자등록번호, 사업장 주소</li>
        </ul>

        <p><strong>- 이용목적:</strong></p>
        <p>매매계약상 의무이행 목적(대금청구서 송부, 대금결제, 탁송, 등록대행 포함), 본인확인 목적 등</p>

        <p><strong>- 이용/보관기간:</strong></p>
        <p>계약상 분쟁 해결을 위한 정보보관 기간이 종료되면 해당 정보를 파기하는 것을 원칙으로 합니다(5년).</p>

        <p><strong>제공 및 변경에 관한 세부 사항</strong></p>
        <p>Trust Ride는 위 제공 업체에게 개인정보를 제공할 경우, 상기한 목적 범위 내에서 제공합니다.</p>

        <button class="confirm-button" onclick="closeTermsModal()">확인</button>
    </div>
</div>


<div id="thirdPartyModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeThirdPartyModal()">&times;</span>
        <h2>[선택] 개인정보 제3자 제공/이용 동의</h2>
        <p>Trust Ride는 한국도로공사의 하이패스 고객정보 현행화와 임차인 변경 서비스를 위해 아래와 같이 고객의 개인정보를 제3자에게 제공하고 있습니다.</p>


        <table class="terms-table">
            <thead>
            <tr>
                <th>제공받는 자</th>
                <th>항목</th>
                <th>이용 목적</th>
                <th>보유 기간</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>한국도로공사</td>
                <td>성명, 휴대전화번호, 주소, 차량번호, 이메일</td>
                <td>하이패스 고객정보 현행화 및 미납 통행료 임차인 변경</td>
                <td>이용 목적과 관련된 사고조사, 분쟁 해결, 법령상 의무이행을 위한 필요 범위 내에서만 보유/이용</td>
            </tr>
            </tbody>
        </table>

        <p>귀하는 동의를 거부할 권리가 있으나, 동의하지 않을 경우 사용 목적 서비스가 제한됩니다.</p>
        <p>단, 당사 사정으로 하이패스 명의변경 (고객정보 현행화) 서비스 이용이 원활하지 않을 수 있습니다.</p>

        <button class="confirm-button" onclick="closeThirdPartyModal()">확인</button>
    </div>
</div>


<div id="identificationModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeIdentificationModal()">&times;</span>
        <h2>[필수] 고유식별정보 수집/이용 동의</h2>
        <p>당사는 자동차관리법 제12조, 자동차등록규칙 제33조에 의거 자동차 소유권 이전등록을 위한 목적으로 신청자의 고유식별정보(주민등록번호)를 수집·이용 합니다.</p>

        <!-- 🚗 테이블 -->
        <table class="terms-table">
            <thead>
            <tr>
                <th>수집항목</th>
                <th>이용목적</th>
                <th>이용/보관기간</th>
                <th>동의 거부 시 불이익</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>주민등록번호</td>
                <td>자동차 소유권 이전등록</td>
                <td>계약상 분쟁 해결을 위한 정보 보관 기간이 종료되면 해당 정보를 파기하는 것을 원칙으로 합니다. (5년)<br>
                    단, 관계법령에 따라 개인정보를 보존해야 하는 경우, 관계 법령에서 정하는 기간까지 보존합니다.
                </td>
                <td>계약 체결 불가</td>
            </tr>
            </tbody>
        </table>

        <p>귀하는 동의를 거부할 권리가 있으나, 동의하지 않을 경우 자동차 소유권 이전등록이 불가능합니다.</p>

        <button class="confirm-button" onclick="closeIdentificationModal()">확인</button>
    </div>
</div>

<div id="benefitModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeBenefitModal()">&times;</span>
        <h2>[선택] 맞춤 서비스 제공 등 혜택/정보 수신 동의</h2>
        <p>Trust Ride는 고객에게 맞춤형 서비스와 혜택을 제공하기 위해 아래와 같이 개인정보를 수집·이용합니다.</p>

        <!-- 📌 테이블 -->
        <table class="terms-table">
            <thead>
            <tr>
                <th>활용하는 개인정보 항목</th>
                <th>개인정보의 수집 이용 목적</th>
                <th>개인정보의 보유 및 이용 기간</th>
                <th>동의 거부에 따른 불이익 내용</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>성명, 휴대전화번호</td>
                <td>새로운 서비스/신상품이나 이벤트 정보 안내, 서비스 제공 및 광고 발송, 통계 및 유효성 확인</td>
                <td>회원 탈퇴 시 즉시 삭제 (단, 신규 서비스 제공을 위한 5년 보관)</td>
                <td>동의하지 않아도 회원가입은 가능하나, 이벤트 혜택 및 맞춤 서비스 제공 불가</td>
            </tr>
            </tbody>
        </table>

        <p>귀하는 동의를 거부할 권리가 있으나, 동의하지 않을 경우 맞춤 서비스 제공이 제한될 수 있습니다.</p>

        <button class="confirm-button" onclick="closeBenefitModal()">확인</button>
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


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    function openBenefitModal() {
        document.getElementById("benefitModal").style.display = "block";
    }

    function closeBenefitModal() {
        document.getElementById("benefitModal").style.display = "none";
    }

    // 바깥 클릭 시 모달 닫기
    window.onclick = function(event) {
        let modal = document.getElementById("benefitModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>


<script>
    function openTermsModal() {
        document.getElementById("termsModal").style.display = "block";
    }

    function closeTermsModal() {
        document.getElementById("termsModal").style.display = "none";
    }

    // 모달 바깥 클릭 시 닫기
    window.onclick = function(event) {
        let modal = document.getElementById("termsModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>


<script>
    //  "보기" 버튼 클릭 시 모달 열기
    function openIdentificationModal() {
        document.getElementById("identificationModal").style.display = "block";
    }

    //  모달 닫기
    function closeIdentificationModal() {
        document.getElementById("identificationModal").style.display = "none";
    }

    //  바깥 클릭 시 모달 닫기
    window.onclick = function(event) {
        let modal = document.getElementById("identificationModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>

<script>
    // 모달 창 열기
    function openModal(message) {
        document.getElementById("errorMessage").innerText = message;
        document.getElementById("errorModal").style.display = "block";
    }

    // 모달 창 닫기
    function closeModal() {
        document.getElementById("errorModal").style.display = "none";
    }

    // 유효성 검사 함수
    function validateForm(event) {
        event.preventDefault(); // 기본 제출 동작 방지

        let userName = document.querySelector("[name='userName']").value.trim();
        let userPhoneNumber = document.querySelector("[name='userPhoneNumber']").value.trim();
        let memberResident = document.querySelector("[name='memberResident']").value.trim();
        let memberAddr1 = document.querySelector("[name='memberAddr1']").value.trim();
        let memberAddr2 = document.querySelector("[name='memberAddr2']").value.trim();
        let deliveryDate = document.querySelector("[name='deliveryDate']").value.trim();
        let memberLicense = document.querySelector("[name='memberLicense']").value.trim();
        let licenseNumber = document.querySelector("[name='licenseNumber']").value.trim();
        let licenseIssuedDate = document.querySelector("[name='licenseIssuedDate']").value.trim();
        let licenseExpiryDate = document.querySelector("[name='licenseExpiryDate']").value.trim();

        // 필수 입력값이 하나라도 비어있는 경우
        if (!userName || !userPhoneNumber || !memberResident || !memberAddr1 || !memberAddr2 || !deliveryDate || !memberLicense || !licenseNumber || !licenseIssuedDate || !licenseExpiryDate) {
            openModal("모든 필수 정보를 입력해 주세요.");
            return false; // 제출 방지
        }

        // 주민등록번호 길이 검사 (13자리)
        if (memberResident.length !== 13) {
            openModal("주민등록번호는 13자리여야 합니다.");
            return false;
        }

        // 전화번호 유효성 검사 (숫자만 허용)
        let phoneRegex = /^[0-9]{10,11}$/;
        if (!phoneRegex.test(userPhoneNumber)) {
            openModal("휴대폰 번호는 10~11자리 숫자만 입력해 주세요.");
            return false;
        }

        // 면허 번호 유효성 검사 (예: 12-34-567890)
        let licenseRegex = /^[0-9]{2}-[0-9]{2}-[0-9]{6}$/;
        if (!licenseRegex.test(licenseNumber)) {
            openModal("면허 번호는 형식에 맞게 입력해 주세요 (예: 12-34-567890).");
            return false;
        }

        // 모든 검사 통과 시 폼 제출
        document.querySelector("form").submit();
    }

    // 폼 제출 버튼에 이벤트 리스너 추가
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelector(".submit-btn").addEventListener("click", validateForm);
    });
</script>

<script>
    function execution_daum_address() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                // 도로명 주소 선택 시
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else { // 지번 주소 선택 시
                    addr = data.jibunAddress;
                }

                // 도로명 주소 선택 시 추가 정보 (법정동, 건물명 등)
                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    addr += extraAddr; // 도로명 주소 + 참고항목 추가
                }

                // 입력 필드에 값 채우기
                document.querySelector("[name=memberAddr1]").value = data.zonecode;  // 우편번호
                document.querySelector("[name=memberAddr2]").value = addr;  // 도로명 주소 또는 지번 주소
                document.querySelector("[name=memberAddr3]").removeAttribute("readonly"); // 상세주소 입력 가능하게

                // 상세주소 입력란으로 포커스 이동
                document.querySelector("[name=memberAddr3]").focus();
            }
        }).open();
    }

</script>

<script>
    // 오늘 날짜를 구해서 input의 min 값으로 설정 (과거 날짜 선택 불가)
    document.addEventListener("DOMContentLoaded", function() {
        let today = new Date().toISOString().split("T")[0];
        document.getElementById("deliveryDate").setAttribute("min", today);
    });
</script>



<script>
    document.addEventListener("DOMContentLoaded", function() {
        let today = new Date().toISOString().split("T")[0];

        // 면허 발급일은 과거 날짜 선택 가능, 하지만 미래 날짜는 제한
        document.getElementById("licenseIssuedDate").setAttribute("max", today);
    });

    // 면허 발급일 선택 시, 만료일 자동 계산 (10년 후)
    function setLicenseExpiryDate() {
        let issueDate = document.getElementById("licenseIssuedDate").value;
        if (issueDate) {
            let expiryDate = new Date(issueDate);
            expiryDate.setFullYear(expiryDate.getFullYear() + 10); // 10년 후 만료
            document.getElementById("licenseExpiryDate").value = expiryDate.toISOString().split("T")[0];
        }
    }

    // 면허 발급일 선택 시 만료일 자동 변경되도록 이벤트 리스너 추가
    document.getElementById("licenseIssuedDate").addEventListener("change", setLicenseExpiryDate);
</script>

<script>
    // "보기" 버튼 클릭 시 개인정보 제3자 제공/이용 동의 모달 열기
    function openThirdPartyModal() {
        document.getElementById("thirdPartyModal").style.display = "block";
    }

    //  모달 닫기
    function closeThirdPartyModal() {
        document.getElementById("thirdPartyModal").style.display = "none";
    }

    // 바깥 클릭 시 모달 닫기
    window.onclick = function(event) {
        let modal = document.getElementById("thirdPartyModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>
