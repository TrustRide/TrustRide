
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
    /* ✅ 전체 레이아웃 및 공통 스타일 */
    body {
        font-family: Arial, sans-serif;
        background: #fff;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    .container {
        display: flex;
        justify-content: space-between;
        width: 90%;
        max-width: 1200px;
        margin: 20px auto;
        flex: 1;
    }

    h2, h3 {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    label {
        font-weight: bold;
        margin-top: 20px;
        display: block;
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

    button {
        cursor: pointer;
    }

    /* ✅ 헤더 스타일 */
    header {
        background: white;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        padding: 15px 0;
        width: 100%;
    }

    .header-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 90%;
        max-width: 1200px;
        margin: 0 auto;
    }

    .logo-container {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .logo-img {
        height: 50px;
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
        align-items: center;
        margin: 0;
        padding: 0;
    }

    nav a {
        text-decoration: none;
        color: #555;
        font-size: 16px;
    }

    .search-bar {
        padding: 8px 12px;
        border: 1px solid #555;
        border-radius: 4px;
    }

    /* ✅ 폼 섹션 */
    .form-section {
        width: 65%;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .submit-btn {
        background: #c00;
        color: white;
        padding: 15px;
        border-radius: 5px;
        border: none;
        width: 100%;
        margin-top: 30px;
        font-size: 16px;
    }


    .summary-section {
        width: 30%;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
        border-radius: 5px;
        margin-bottom: 15px;
    }

    .info-buttons {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 10px;
        margin-top: 15px;
    }

    .info-button {
        border: 1px solid #ddd;
        background: white;
        border-radius: 12px;
        font-weight: bold;
        padding: 12px;
    }

    .info-button:hover {
        background: #f1f1f1;
    }

    .price-box {
        font-size: 16px;
        color: #555;
        margin-top: 15px;
        text-align: left;
    }

    .price-box div {
        margin-bottom: 10px;
    }

    .total-price {
        font-weight: bold;
        color: red;
        font-size: 18px;
    }

    .total-price span {
        font-size: 22px;
        color: red;
    }

    /* ✅ 주소입력 */
    .address_wrap {
        margin-top: 20px;
    }

    .address_button {
        border: 1px solid #ccc;
        padding: 12px;
        margin-top: 5px;
        border-radius: 5px;
        background: white;
        text-align: center;
    }

    /* ✅ 면허 입력 */
    .license-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;
        margin-bottom: 20px;
    }

    /* ✅ 약관 동의 */
    .terms-container {
        background: #f9f9f9;
        padding: 20px;
        border-radius: 10px;
        margin-top: 30px;
    }

    .terms-box {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #ddd;
    }

    .terms-box:last-child {
        border-bottom: none;
    }

    .terms-box label {
        font-size: 14px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .terms-box a {
        color: darkred;
        font-size: 13px;
    }

    /* ✅ 모달 */
    /* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
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
        overflow: hidden;
    }

    /* 모달 콘텐츠 스타일 */
    .modal-content {
        position: relative;
        padding: 20px;
    }

    /* 닫기 버튼 스타일 */
    .close {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 22px;
        cursor: pointer;
    }

    /* 확인 버튼 스타일 */
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

    /* 테이블 스타일 */
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

    /* ✅ 푸터 */
    .footer {
        width: 100%;
        background-color: #f9f9f9;
        padding: 20px 0;
        border-top: 1px solid #ddd;
        font-size: 14px;
        color: #333;
        margin-top: auto;
    }

    .footer-container {
        max-width: 1000px;
        margin: 0 auto;
        padding: 0 20px;
    }

    .footer-logo {
        font-size: 18px;
        font-weight: bold;
        color: red;
        margin-bottom: 10px;
    }



    /* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        z-index: 1000;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        width: 80%;
        max-width: 500px;
        background: white;
        padding: 20px;
        text-align: left;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        overflow: hidden;
    }

    /* 모달 콘텐츠 스타일 */
    .modal-content {
        position: relative;
        padding: 20px;
    }

    /* 닫기 버튼 스타일 */
    .close {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 22px;
        cursor: pointer;
    }

    /* 확인 버튼 스타일 */
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
                <li><a href="${pageContext.request.contextPath}/userList">내차사기</a></li>
                <li><a href="${pageContext.request.contextPath}/review">상품리뷰</a></li>


                <c:if test="${not empty sessionScope.loginUser}">
                    <li>${sessionScope.loginUser.userName}님 환영합니다.</li>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                </c:if>
                <c:if test="${empty sessionScope.loginUser}">
                    <a href="${pageContext.request.contextPath}/login.do">로그인</a>
                    <li><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
                </c:if>

            </ul>
        </nav>

        <input type="text" placeholder="🔍차량을 검색하세요." class="search-bar">
    </div>
</header>

<div class="container">
    <!-- 왼쪽 폼 섹션 -->
    <div class="form-section">


        <h2><%= title %>를 선택했습니다.</h2> <!-- 선택한 버튼에 따라 제목 변경됨 -->
        <p>이제 명의자 정보와 배송 정보를 입력해 주세요.</p>
        <form action="/gearshift/payment/select" method="post">
            <input type="hidden" name="userId" value="${userDto.userId}">

            <!--명의 종류 값 넘김-->
            <input type="hidden" name="ownershipType" value="<%= title %>">

            <!--회원 이름 값 안넘김 -->
            <label>회원 이름</label>
            <input type="text" name="userName" value="${userDto.userName}" readonly>

            <!--명의자 전화번호 값 넘김 -->
            <label>회원 휴대폰 번호</label>
            <input type="text" name="userPhoneNumber" value="${userDto.userPhoneNumber}" readonly>


            <!-- 명의자 이름 값 넘김 -->
            <label>명의자 이름</label>
            <input type="text" name="holderName" >

            <!-- 명의자 전화번호 값 넘김 -->
            <label>명의자 전화번호</label>
            <input type="text" name="holderPhoneNumber">


            <!-- 명의자 주민등록번호 값 넘김 -->
            <label>명의자 주민등록번호</label>
            <input type="text" id="holderResident" name="holderResident" placeholder="13자리 입력" maxlength="13">



            <!--명의자 주소 값 넘김 -->
            <div class="address_wrap">
                <label>명의자 주민등록 주소지</label>
                <input type="text" name="holderAddr1" readonly placeholder="우편번호">
                <button type="button" class="address_button" onclick="execution_daum_address()">우편번호 찾기</button>
                <input type="text" name="holderAddr2" readonly placeholder="도로명 주소 또는 지번 주소">
                <input type="text" name="holderAddr3" placeholder="상세주소 입력">
            </div>


            <label for="deliveryDate">희망 배송일</label>
            <input type="date" id="deliveryDate" name="deliveryDate" min="">
            <label for="deliveryDate">요청사항</label>
            <input type="text" name="deliveryRequest">




            <!-- 면허 종류 선택 -->
            <h3>면허 정보 입력</h3>
            <div class="license-grid">
                <!-- 면허 종류 선택 값넘김 -->
                <div class="license-field">
                    <label for="holderLicense">면허 종류</label>
                    <select id="holderLicense" name="holderLicense">
                        <option value="">면허 종류 선택</option>
                        <option value="1종 보통">1종 보통</option>
                        <option value="1종 대형">1종 대형</option>
                        <option value="2종 보통">2종 보통</option>
                        <option value="2종 소형">2종 소형</option>
                    </select>
                </div>

                <input type="hidden" name="deliveryFee" value="0">

                <!-- 면허 번호 입력  안넘김-->
                <div class="license-field">
                    <label for="licenseNumber">면허 번호</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" placeholder="예: 12-34-567890">
                </div>



                <!-- 면허 발급일 선택  값 안넘김-->
                <div class="license-field">
                    <label for="licenseIssuedDate">면허 발급일</label>
                    <input type="date" id="licenseIssuedDate" name="licenseIssuedDate" onchange="setLicenseExpiryDate()">
                </div>


                <!-- 면허 만료일 (자동 계산) 값 안넘김 -->
                <div class="license-field">
                    <label for="licenseExpiryDate">면허 만료일</label>
                    <input type="date" id="licenseExpiryDate" name="licenseExpiryDate" readonly>
                </div>
            </div>



            <div class="terms-container">
                <!-- 배송원1 -->
                <div class="terms-box">
                    <label><input type="radio" name="delivery" class="terms-checkbox" value="김철수,010-1234-5678" required> 배송원1</label>
                    <a href="#" onclick="openDeliveryModal(1)">보기</a>
                </div>

                <!-- 배송원2 -->
                <div class="terms-box">
                    <label><input type="radio" name="delivery" class="terms-checkbox" value="이영희,010-2345-6789"> 배송원2</label>
                    <a href="#" onclick="openDeliveryModal(2)">보기</a>
                </div>

                <!-- 배송원3 -->
                <div class="terms-box">
                    <label><input type="radio" name="delivery" class="terms-checkbox" value="박민수,010-3456-7890" required> 배송원3</label>
                    <a href="#" onclick="openDeliveryModal(3)">보기</a>
                </div>

                <!-- 배송원4 -->
                <div class="terms-box">
                    <label><input type="radio" name="delivery" class="terms-checkbox" value="최진호,010-4567-8901"> 배송원4</label>
                    <a href="#" onclick="openDeliveryModal(4)">보기</a>
                </div>
            </div>


            <div id="deliveryModal1" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal(1)">&times;</span>
                    <h2>배송원1 정보</h2>
                    <div class="modal-image">
                        <img src="<c:url value='/resources/img/di1.jpg' />" alt="배송원 1" class="logo-img"></a>
                    </div>
                    <p>배송원1 이름: 김철수</p>
                    <p>배송원1 연락처: 010-1234-5678</p>
                    <p>배송원1 주소: 서울시 강남구</p>
                    <p>배송원1 경력: Trust Ride 근무 3년차</p>
                    <button class="confirm-button" onclick="closeModal(1)">확인</button>
                </div>
            </div>

            <!-- 모달 2 - 배송원2 정보 -->
            <div id="deliveryModal2" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal(2)">&times;</span>
                    <h2>배송원2 정보</h2>
                    <div class="modal-image">
                        <img src="<c:url value='/resources/img/di1.jpg' />" alt="배송원 2" class="logo-img"></a>
                    </div>
                    <p>배송원2 이름: 이영희</p>
                    <p>배송원2 연락처: 010-2345-6789</p>
                    <p>배송원2 주소: 서울시 송파구</p>
                    <p>배송원 2 경력: Trust Ride 근무 2년차</p>
                    <button class="confirm-button" onclick="closeModal(2)">확인</button>
                </div>
            </div>

            <!-- 모달 3 - 배송원3 정보 -->
            <div id="deliveryModal3" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal(3)">&times;</span>
                    <h2>배송원3 정보</h2>
                    <div class="modal-image">
                        <img src="<c:url value='/resources/img/di1.jpg' />" alt="배송원 3" class="logo-img"></a>
                    </div>
                    <p>배송원3 이름: 박민수</p>
                    <p>배송원3 연락처: 010-3456-7890</p>
                    <p>배송원3 주소: 서울시 강북구</p>
                    <p>배송원 3 경력: Trust Ride 근무 6년차</p>
                    <button class="confirm-button" onclick="closeModal(3)">확인</button>
                </div>
            </div>

            <!-- 모달 4 - 배송원4 정보 -->
            <div id="deliveryModal4" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal(4)">&times;</span>
                    <h2>배송원4 정보</h2>
                    <div class="modal-image">
                        <img src="<c:url value='/resources/img/di1.jpg' />" alt="배송원 4" class="logo-img"></a>
                    </div>
                    <p>배송원4 이름: 최진호</p>
                    <p>배송원4 연락처: 010-4567-8901</p>
                    <p>배송원4 주소: 서울시 용산구</p>
                    <p>배송원 4 경력: Trust Ride 근무 5년차</p>
                    <button class="confirm-button" onclick="closeModal(4)">확인</button>
                </div>
            </div>



            <div class="terms-container">
                <h3>약관 동의</h3>

                <!-- 전체 동의 -->
                <label class="terms-main">
                    <input type="checkbox" id="allAgree" onclick="toggleAllCheckboxes(this)">
                    <strong>전체 동의하기</strong>
                </label>

                <!-- 개별 약관 -->
                <div class="terms-box">
                    <label>
                        <input type="checkbox" class="agreement-checkbox" name="agreePrivacy" value="false" required onchange="updateCheckboxValue(this)">
                        개인정보 수집/이용 동의 (필수)
                    </label>
                    <a href="#" onclick="openTermsModal()">보기</a>
                </div>

                <div class="terms-box">
                    <label>
                        <input type="checkbox" class="agreement-checkbox" name="agreeThirdParty" value="false" onchange="updateCheckboxValue(this)">
                        개인정보 제3자 제공/이용 동의 (선택)
                    </label>
                    <a href="#" onclick="openThirdPartyModal()">보기</a>
                </div>

                <div class="terms-box">
                    <label>
                        <input type="checkbox" class="agreement-checkbox" name="agreeResident" value="false" required onchange="updateCheckboxValue(this)">
                        고유식별정보 수집/이용 동의 (필수)
                    </label>
                    <a href="#" onclick="openIdentificationModal()">보기</a>
                </div>

                <div class="terms-box">
                    <label>
                        <input type="checkbox" class="agreement-checkbox" name="agreeMarketing" value="false" onchange="updateCheckboxValue(this)">
                        맞춤 서비스 제공 등 혜택/정보 수신 동의 (선택)
                    </label>
                    <a href="#" onclick="openBenefitModal()">보기</a>
                </div>
            </div>

            <input type="hidden" name="carInfoId" value="${carDto.carInfoId}">
            <!--배송원 정보 -->

            <input type="hidden" name="deliveryDriverName">
            <input type="hidden" name="driverPhoneNumber">
            <!-- 다음 버튼 -->
            <button type="submit" class="submit-btn">다음</button>
        </form>

    </div>


    <div class="summary-section">
        <div class="order-box">
            <img src="<c:url value='/resources/img/3car3.png' />" alt="Trust Ride Logo" class="logo-img">
            <h3>${carDto.modelName}</h3>
            <p>43다5558 | ${carDto.manufactureYear} ·${carDto.mileage} ·  ${carDto.fuelType}</p>

            <div class="info-buttons">
                <button class="info-button">차량옵션</button>
                <button class="info-button">성능·상태 점검기록부</button>
                <button class="info-button">Trust Ride 진단서</button>
                <button class="info-button">보험이력조회</button>
            </div>

            <hr>

            <div>차량가격: <span>${carDto.carPrice}원</span></div>
            <div>이전등록비: <span>${carDto.previousRegistrationFee}원</span></div>
            <div>등록대행수수료: <span>${carDto.agencyFee}원</span></div>
            <div>배송비: <span>0원</span></div><hr>
            <div class="total-price">총 합계: <span>${carDto.carAmountPrice}원</span></div>
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
    document.querySelector(".submit-btn").addEventListener("click", function(event) {
        // 선택된 배송원 라디오 버튼 찾기
        const selectedDelivery = document.querySelector('input[name="delivery"]:checked');

        if (selectedDelivery) {
            // 선택된 배송원 정보 가져오기 (value값)
            const deliveryInfo = selectedDelivery.value.split(',');

            // 배송원 정보 (ID, 이름, 전화번호)
            const deliveryName = deliveryInfo[0];
            const deliveryPhone = deliveryInfo[1];


            // hidden input 필드에 값 넣기
            document.querySelector("[name='deliveryDriverName']").value = deliveryName;
            document.querySelector("[name='driverPhoneNumber']").value = deliveryPhone;

            // 폼 제출

        } else {
            // 배송원 선택 안한 경우 에러 메시지 표시
            openModal("배송원을 선택해 주세요.");
            event.preventDefault(); // 폼 제출 막기
        }
    });
</script>


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



        // 면허 번호 유효성 검사 (예: 12-34-567890)
        let licenseRegex = /^[0-9]{2}-[0-9]{2}-[0-9]{6}$/;
        if (!licenseRegex.test(licenseNumber)) {
            openModal("면허 번호는 형식에 맞게 입력해 주세요 (예: 12-34-567890).");
            return false;
        }

        // 모든 검사 통과 시 폼 제출

    }

    // 폼 제출 버튼에 이벤트 리스너 추가

</script>

<script>
    function execution_daum_address() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

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
                    addr += extraAddr;
                }

                document.querySelector("[name=holderAddr1]").value = data.zonecode;
                document.querySelector("[name=holderAddr2]").value = addr;
                document.querySelector("[name=holderAddr3]").removeAttribute("readonly");
                document.querySelector("[name=holderAddr3]").focus();
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

<script>
    // 배송원 정보 모달 열기
    function openDeliveryModal(deliveryId) {
        // 해당 배송원 모달을 표시
        var modal = document.getElementById("deliveryModal" + deliveryId);
        if (modal) {
            modal.style.display = "block";
        }
    }

    // 모달 닫기
    function closeModal(deliveryId) {
        var modal = document.getElementById("deliveryModal" + deliveryId);
        if (modal) {
            modal.style.display = "none";
        }
    }

    // 바깥 클릭 시 모달 닫기
    window.onclick = function(event) {
        for (let i = 1; i <= 4; i++) {
            let modal = document.getElementById("deliveryModal" + i);
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
    }
</script>
<script>
    // 체크박스 값 업데이트 함수
    function updateCheckboxValue(checkbox) {
        checkbox.value = checkbox.checked ? "true" : "false";
    }

    // 전체 동의 체크박스 클릭 시, 개별 체크박스 자동 체크/해제
    function toggleAllCheckboxes(masterCheckbox) {
        const checkboxes = document.querySelectorAll('.agreement-checkbox');
        checkboxes.forEach(cb => {
            cb.checked = masterCheckbox.checked;
            updateCheckboxValue(cb);
        });
    }

    // 유효성 검사 함수
    function validateForm(event) {
        event.preventDefault(); // 기본 제출 동작 방지

        // 약관 동의 체크박스 값 확인
        const agreePrivacy = document.querySelector("[name='agreePrivacy']").checked;
        const agreeResident = document.querySelector("[name='agreeResident']").checked;
        const allAgree = document.querySelector("#allAgree").checked;

        // 전체 동의 체크박스가 체크되면, 필수 약관도 자동으로 체크하도록 설정
        if (allAgree) {
            document.querySelector("[name='agreePrivacy']").checked = true;
            document.querySelector("[name='agreeResident']").checked = true;
        }

        // 필수 동의 항목이 체크되지 않으면 에러 표시
        if (!agreePrivacy || !agreeResident) {
            openModal("모든 필수 약관에 동의해 주세요.");
            return false; // 폼 제출 방지
        }

        // 모든 검사 통과 시 폼 제출
        document.querySelector("form").submit();
    }

</script>






</body>
</html>
