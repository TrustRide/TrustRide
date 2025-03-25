<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>차량 명의 선택</title>

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

        /* ✅ 중앙 컨텐츠 전체 정렬 */
        .container {
            display: flex;
            justify-content: space-between; /* 양쪽 정렬 */
            align-items: flex-start; /* 왼쪽과 오른쪽의 상단 정렬 */
            max-width: 1000px; /* ✅ 최대 너비 설정 */
            width: 100%;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 140px auto 40px auto; /* ✅ 헤더와 간격 유지 */
        }

        /* ✅ 왼쪽 섹션 (명의 선택 버튼) */
        .left-section {
            flex: 1.2; /* ✅ 왼쪽 공간을 넓게 배분 */
            padding-right: 30px;
        }

        .left-section h2 {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* ✅ 선택 버튼 스타일 */
        .option-button {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            background: white;
            border-radius: 8px;
            font-size: 16px;
            text-align: left;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .option-button:hover {
            background: #f1f1f1;
        }

        .option-button.active {
            border-color: red;
            background: #ffe6e6;
        }


        .info-box {
            background: #f8f8f8;
            padding: 15px;
            font-size: 14px;
            border-radius: 5px;
            color: #555;
            margin-bottom: 20px;
        }


        .next-button {
            width: 100%;
            padding: 15px;
            background-color: darkred;
            color: white;
            border: none;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
        }


        .right-section {
            flex: 1;
            padding-left: 20px;
            background: #fff;
            border-left: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
        }


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


        .price-summary {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 350px; /* 최대 너비 설정 */
            margin: 20px auto;
            font-family: Arial, sans-serif;
        }

        .price-summary h3 {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .price-item {
            display: flex;
            justify-content: space-between;
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .price-item .label {
            font-weight: bold;
        }

        .price-item .value {
            color: #333;
        }

        .total .label {
            font-weight: bold;
            font-size: 18px;
        }

        .total .value {
            color: red;
            font-size: 20px;
            font-weight: bold;
        }

        /* Responsive Design (모바일 대응) */
        @media (max-width: 768px) {
            .price-summary {
                max-width: 100%; /* 화면 크기에 맞게 너비 조정 */
                padding: 15px;
            }
            .price-item {
                font-size: 14px; /* 작은 화면에서 글씨 크기 줄이기 */
            }
        }


        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
        }


        .modal-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            width: 280px;
        }


        .close {
            float: right;
            font-size: 20px;
            cursor: pointer;
        }


        .confirm-button {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>


</head>
<body>

<header>
    <div class="header-content">
        <div class="logo-container">
            <a href="/gearshift/main">
                <img src="${pageContext.request.contextPath}/resources/img/trustride.png" alt="Trust Ride Logo" class="logo-img">
            </a>
            <h1 class="logo">Trust Ride</h1>
        </div>
        <nav>
            <ul>
                <li><a href="/gearshift/userList">내차사기</a></li>
                <li><a href="#">상품리뷰</a></li>
                <a href="/gearshift/login">로그인</a>
                <li><a href="#">회원가입</a></li>
            </ul>
        </nav>

    </div>
</header>

<div class="container">
    <!-- 왼쪽 섹션 -->
    <div class="left-section">
        <h2>차량 명의자를 선택해 주세요.</h2>


        <button class="option-button" onclick="selectOption('개인 명의를 선택했습니다', this)">개인 명의로 등록할게요.</button>
        <button class="option-button" onclick="selectOption('개인 공동 명의를 선택하셨습니다.', this)">개인 명의로 등록하고, 공동 명의자가 있어요.</button>
        <button class="option-button" onclick="selectOption('개인사업자 명의를 선택하셨습니다.', this)">개인사업자 명의로 등록할게요.</button>
        <button class="option-button" onclick="selectOption('개인사업자 공동 명의를 선택하셨습니다.', this)">개인사업자 명의로 등록하고, 공동 명의자가 있어요.</button>
        <button class="option-button" onclick="selectOption('법인사업자 명의를 선택하셨습니다.', this)">법인사업자 명의로 등록할게요.</button>


        <div class="info-box">
            차량 계약 및 배송을 위해 회원정보를 사용할게요.<br>
            계약 정보를 사용하면 명의자 이름, 휴대폰번호, 배송지 등 차량 계약 및 배송에 필요한 정보가 자동으로 입력됩니다.
        </div>
        <div class="info-box">
            <p>차량 계약 및 배송을 위해 회원정보를 사용할게요.</p>
            <label>
                <input type="radio" name="agreement" value="agree"> 동의함
            </label>
            <label>
                <input type="radio" name="agreement" value="disagree"> 동의하지 않음
            </label>
        </div>


        <button class="next-button" onclick="goToDelivery()">다음</button>
    </div>

    <!-- 오른쪽 주문 섹션 -->
    <div class="right-section">
        <div class="order-box">
            <img src="<c:url value='/resources/img/3car3.png' />" alt="Trust Ride Logo" class="logo-img">
            <h3>${carDto.modelName}</h3>
            <p>${carDto.carNum} | ${carDto.manufactureYear} 식  · ${carDto.mileage}km · ${carDto.fuelType}</p>

            <div class="info-buttons">
                <button class="info-button">차량옵션</button>
                <button class="info-button">성능·상태 점검기록부</button>
                <button class="info-button">Trust Ride 진단서</button>
                <button class="info-button">보험이력조회</button>
            </div>

            <hr>

            <div class="price-summary">
                <h3>예상 결제 금액</h3>
                <div class="price-item">
                    <span class="label">차량가격</span>
                    <span class="value">${carDto.carPrice}원</span>
                </div>
                <div class="price-item">
                    <span class="label">이전등록비</span>
                    <span class="value">${carDto.previousRegistrationFee}원</span>
                </div>
                <div class="price-item">
                    <span class="label">등록대행수수료</span>
                    <span class="value">${carDto.agencyFee}원</span>
                </div>
                <div class="price-item">
                    <span class="label">배송비</span>
                    <span class="value">0원</span>
                </div><hr>
                <div class="price-item total">
                    <span class="label">총 합계</span>
                    <span class="value">${carDto.carAmountPrice}원</span>
                </div>
            </div>
        </div>
    </div>
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

<div id="modal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <p id="modal-message">메시지</p> <!-- 동적으로 메시지 변경 -->
        <button class="confirm-button" onclick="closeModal()">확인</button>
    </div>
</div>


<script>
    let selectedTitle = ""; // 선택한 차량 명의자 값
    let selectedButton = null; // 선택된 명의자 버튼

    function selectOption(selection, button) {
        if (selectedButton === button) {
            selectedButton.classList.remove('active');
            selectedTitle = "";
            selectedButton = null;
        } else {
            document.querySelectorAll('.option-button').forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            selectedTitle = selection;
            selectedButton = button;
        }
    }

    function goToDelivery() {
        if (selectedTitle === "") {
            showModal("차량 명의자를 선택해 주세요.");
            return;
        }

        let agreement = document.querySelector("input[name='agreement']:checked");
        if (!agreement || agreement.value === "disagree") {
            showModal("회원정보 이용에 동의해야 진행할 수 있습니다.");
            return;
        }

        // ✅ carInfoId 넘기기
        const carInfoId = ${carDto.carInfoId};

        // ✅ title + carInfoId 함께 전달
        window.location.href = "/gearshift/delivery?title=" + encodeURIComponent(selectedTitle) + "&carInfoId=" + carInfoId;
    }

    function showModal(message) {
        document.getElementById("modal-message").innerText = message;
        document.getElementById("modal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("modal").style.display = "none";
    }
</script>



</body>
</html>