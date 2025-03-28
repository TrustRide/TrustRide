<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>결제 수단 선택</title>
</head>
<body>
<div class="container">
  <!-- 결제 방법 선택 영역-->
    <div>
      <h2>주문 내역 확인</h2>
      <h3>주문 내역을 확인하고 원하시는 결제 방법을 선택해주세요.</h3>
    </div>

    <div>
      <h3>결제방법</h3>
    </div>

    <div class="payment-buttons">
      <button type="button" onclick="selectPaymentMethod('현금')">현금</button>
      <button type="button" onclick="selectPaymentMethod('신용카드')">신용카드</button>
    </div>
    <form action="/gearshift/payment/detail" method="post">
      <!-- 선택한 결제 수단 -->
      <input type="hidden" name="paymentMethod" id="paymentMethod">

      <input type="hidden" name="carInfoId" value="${carInfo.carInfoId}">
      <input type="hidden" name="deliveryFee" value="${carInfoDto.deliveryFee}">
      <input type="hidden" name="driverPhoneNumber" value="${carInfoDto.driverPhoneNumber}">
      <input type="hidden" name="preferredDate" value="${carInfo.preferredDate}">
      <input type="hidden" name="deliveryRequest" value="${carInfo.deliveryRequest}">
      <input type="hidden" name="deliveryDriverName" value="${carInfoDto.deliveryDriverName}">
      <input type="hidden" name="carAmountPrice" value="${carInfo.carAmountPrice}">

      <input type="hidden" name="holderName" value="${carInfoDto.holderName}">
      <input type="hidden" name="holderPhoneNumber" value="${carInfoDto.holderPhoneNumber}">
      <input type="hidden" name="holderResident" value="${carInfoDto.holderResident}">
      <input type="hidden" name="holderAddr1" value="${carInfoDto.holderAddr1}">
      <input type="hidden" name="holderAddr2" value="${carInfoDto.holderAddr2}">
      <input type="hidden" name="holderAddr3" value="${carInfoDto.holderAddr3}">
      <input type="hidden" name="holderlicense" value="${carInfoDto.holderLicense}">

      <!-- 결제 버튼 -->
      <button type="submit">결제</button>

    </form>


    <!-- 오른쪽 주문 섹션 -->
    <div class="right-section">
      <div class="order-box">
        <img src="<c:url value='/resources/img/3car3.png' />" alt="Trust Ride Logo" class="logo-img">
        <h3>${carInfo.modelName}</h3>
        <p>${carInfo.carNum} | ${carInfo.manufactureYear} 식  · ${carInfo.mileage}km · ${carInfo.fuelType}</p>

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
            <span class="value">${carInfo.carPrice}원</span>
          </div>
          <div class="price-item">
            <span class="label">이전등록비</span>
            <span class="value">${carInfo.previousRegistrationFee}원</span>
          </div>
          <div class="price-item">
            <span class="label">등록대행수수료</span>
            <span class="value">${carInfo.agencyFee}원</span>
          </div>
          <div class="price-item">
            <span class="label">배송비</span>
            <span class="value">${carInfoDto.deliveryFee}</span>
          </div><hr>
          <div class="price-item total">
            <span class="label">총 합계</span>
            <span class="value">${carInfo.carAmountPrice}원</span>
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


<script>
  function selectPaymentMethod(method) {
    document.getElementById("paymentMethod").value = method;
  }
</script>
</body>
</html>
