<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>차량 명의 선택</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/user/userTitleHolder.css' />">



</head>
<body>

<header>
    <div class="header-content">
        <div class="logo-container">
            <a href="/gearshift/">
                <img src="${pageContext.request.contextPath}/resources/img/trustride.png" alt="Trust Ride Logo" class="logo-img">
            </a>
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

    </div>
</header>

<div class="container">
    <!-- 왼쪽 섹션 -->
    <div class="left-section">


        <h2>차량 명의자를 선택해 주세요.</h2>

        <button class="option-button" onclick="selectOption('개인 명의', this)">개인 명의로 등록할게요.</button>
        <button class="option-button" onclick="selectOption('개인 공동 명의', this)">개인 명의로 등록하고, 공동 명의자가 있어요.</button>
        <button class="option-button" onclick="selectOption('개인사업자 명의', this)">개인사업자 명의로 등록할게요.</button>
        <button class="option-button" onclick="selectOption('개인사업자 공동 명의', this)">개인사업자 명의로 등록하고, 공동 명의자가 있어요.</button>
        <button class="option-button" onclick="selectOption('법인사업자 명의', this)">법인사업자 명의로 등록할게요.</button>


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
            <div class="order-progress">
                <div class="step-title">명의자 선택</div>
                <div class="progress-bar-wrapper">
                    <div class="progress-bar-fill"></div>
                </div>
                <div class="step-count">1/4</div>
            </div>



            <c:choose>
                <c:when test="${not empty carDto.images}">
                    <img src="${pageContext.request.contextPath}${carDto.images[0].imageUrl}" alt="대표 이미지"
                         style="width: 100%; max-width: 320px; border-radius: 8px; margin-bottom: 15px;" />
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="기본 이미지"
                         style="width: 100%; max-width: 320px; border-radius: 8px; margin-bottom: 15px;" />
                </c:otherwise>
            </c:choose>
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
                    <span class="value">0</span>
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

    // 명의자 선택 버튼 클릭 처리
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

    // 다음 버튼 클릭 시 배송지 입력 페이지로 이동
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

        const carInfoId = ${carDto.carInfoId};

        // 공동 명의 여부 판별 (문구에 "공동"이 포함되어 있는지)
        let isJoint = selectedTitle.includes("공동") ? "true" : "false";

        // title + carInfoId + isJointHolder 전달
        window.location.href = "/gearshift/delivery?title=" + encodeURIComponent(selectedTitle)
            + "&carInfoId=" + carInfoId
            + "&isJointHolder=" + isJoint;
    }

    // 모달 메시지 출력 함수
    function showModal(message) {
        document.getElementById("modal-message").innerText = message;
        document.getElementById("modal").style.display = "flex";
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById("modal").style.display = "none";
    }
</script>


</body>
</html>