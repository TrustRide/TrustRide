<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>결제 상세 페이지</title>
  <script>
    // 결제 방식에 따라 동작 결정
    function handlePayment() {
      var paymentMethod = document.getElementById("paymentMethod").value;   // 선택한 결제 수단 값
      var form = document.getElementById("paymentForm");                    // 폼 태그

      if (paymentMethod === "현금") {
        // 현금 결제일 경우 모달 창 표시 (action은 나중에 변경)
        document.getElementById("accountModal").style.display = "block";
      } else {
        // 신용카드 결제일 경우, 결제 API 페이지로 이동하도록 form action 변경
        form.action = "/gearshift/user/payment/creditCard";
        form.submit(); // 즉시 form 제출
      }
    }

    // 현금 결제 확인 후 다음 페이지 이동
    function proceedToNextPage() {
      var form = document.getElementById("paymentForm");     // 폼 태그
      form.action = "/gearshift/user/orders/status/cash"; // 현금 결제 성공 페이지로 이동하도록 action 변경
      form.submit(); // form 제출
    }
  </script>
</head>
<body>
<div class="container-detail">
  <!-- 총 결제 금액 상세-->
  <main>
    <div>
      <h3>총 결제금액</h3>
      <h2>${carInfo.carAmountPrice}</h2>
    </div>

    <div>
      <div>결제상세</div>
      <div>차량가 ${carInfo.carPrice}</div>
      <div>이전등록비 ${carInfo.previousRegistrationFee}</div>
      <div>관리비용 ${carInfo.maintenanceCost}</div>
      <div>배송비 ${carInfoDto.deliveryFee}</div>
      <div>결제 금액 ${carInfo.carAmountPrice}</div>
    </div>

    <!-- form 태그: 결제가 완료되는 순간 서버로 데이터를 넘김 -->
    <form id="paymentForm" method="post">
      <!-- 선택한 결제 수단 -->
      <input type="hidden" name="paymentMethod" id="paymentMethod" value="${carInfoDto.paymentMethod}">

      <input type="hidden" name="carInfoId" value="${carInfo.carInfoId}">
      <input type="hidden" name="deliveryFee" value="${carInfoDto.deliveryFee}">
      <input type="hidden" name="driverPhoneNumber" value="${carInfoDto.driverPhoneNumber}">
      <input type="hidden" name="preferredDate" value="${carInfoDto.preferredDate}">
      <input type="hidden" name="deliveryRequest" value="${carInfoDto.deliveryRequest}">
      <input type="hidden" name="deliveryDriverName" value="${carInfoDto.deliveryDriverName}">
      <input type="hidden" name="carAmountPrice" value="${carInfo.carAmountPrice}">

      <input type="hidden" name="holderName" value="${carInfoDto.holderName}">
      <input type="hidden" name="holderPhoneNumber" value="${carInfoDto.holderPhoneNumber}">
      <input type="hidden" name="holderResident" value="${carInfoDto.holderResident}">
      <input type="hidden" name="holderAddr1" value="${carInfoDto.holderAddr1}">
      <input type="hidden" name="holderAddr2" value="${carInfoDto.holderAddr2}">
      <input type="hidden" name="holderAddr3" value="${carInfoDto.holderAddr3}">
      <input type="hidden" name="holderLicense" value="${carInfoDto.holderLicense}">
      <input type="hidden" name="ownershipType" value="${carInfoDto.ownershipType}">
      <input type="hidden" name="isJointOwnership" value="${carInfoDto.isJointOwnership}">
    </form>

    <!-- 결제 버튼 -->
    <button type="button" onclick="handlePayment()">즉시결제</button>
  </main>

  <!-- 오른쪽 주문 섹션 -->
  <div class="right-section">
    <div class="order-box">
      <img src="${pageContext.request.contextPath}${carInfo.images[0].imageUrl}" alt="대표 이미지"
           style="width: 100%; max-width: 320px; border-radius: 8px; margin-bottom: 15px;" />
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

<!-- 계좌번호 안내창 모달창 -->
<div id="accountModal" style="display:none; position:fixed; top:50%; left:50%;  transform:translate(-50%, -50%);
      background:white; padding:20px; border-radius:10px; box-shadow: 0 0 10px rgba(0,0,0,0.3);">
  <p>계좌번호: <strong>123-4567-8901</strong></p>
  <button onclick="proceedToNextPage()">확인</button>
</div>
</body>
</html>
