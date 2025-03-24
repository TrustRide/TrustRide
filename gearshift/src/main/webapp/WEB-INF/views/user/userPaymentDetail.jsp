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
        form.action = "/gearshift/payment/creditCard";
        form.submit(); // 즉시 form 제출
      }
    }

    // 현금 결제 확인 후 다음 페이지 이동
    function proceedToNextPage() {
      var form = document.getElementById("paymentForm");     // 폼 태그
      form.action = "/gearshift/orders/status/cash"; // 현금 결제 성공 페이지로 이동하도록 action 변경
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
      <h2>${paymentDTO.carAmountPrice}</h2>
    </div>

    <div>
      <div>결제상세</div>
      <div>차량가 ${paymentDTO.carPrice}</div>
      <div>이전등록비 ${paymentDTO.extendedWarrantyPrice}</div>
      <div>관리비용 ${paymentDTO.maintenanceCost}</div>
      <div>배송비 ${paymentDTO.deliveryFee}</div>
      <div>결제 금액 ${paymentDTO.carAmountPrice}</div>
    </div>

    <!-- form 태그: 결제가 완료되는 순간 서버로 데이터를 넘김 -->
    <form id="paymentForm" method="post">
      <!-- 선택한 결제 수단 -->
      <input type="hidden" name="paymentMethod" id="paymentMethod" value="${paymentDTO.paymentMethod}">

      <input type="hidden" name="productName" value="${paymentDTO.modelName}">
      <input type="hidden" name="orderAmount" value="${paymentDTO.carAmountPrice}">
      <input type="hidden" name="discountAmount" value="0">
      <input type="hidden" name="totalAmount" value="${paymentDTO.carAmountPrice-0}">
      <input type="hidden" name="ownershipType" value="개인명의자">
      <input type="hidden" name="isJointOwnership" value="false">
      <input type="hidden" name="userId" value="${paymentDTO.userId}">
      <input type="hidden" name="carNum" value="${paymentDTO.carNum}">
      <input type="hidden" name="manufactureYear" value="${paymentDTO.manufactureYear}">
      <input type="hidden" name="mileage" value="${paymentDTO.mileage}">
      <input type="hidden" name="fuelType" value="${paymentDTO.fuelType}">
      <input type="hidden" name="carPrice" value="${paymentDTO.carPrice}">
      <input type="hidden" name="extendedWarrantyPrice" value="${paymentDTO.extendedWarrantyPrice}">
      <input type="hidden" name="maintenanceCost" value="${paymentDTO.maintenanceCost}">
      <input type="hidden" name="deliveryFee" value="${paymentDTO.deliveryFee}">
      <input type="hidden" name="driverPhoneNumber" value="${paymentDTO.driverPhoneNumber}">
      <input type="hidden" name="deliveryRequest" value="${paymentDTO.deliveryRequest}">
      <input type="hidden" name="preferredDate" value="${paymentDTO.preferredDate}">
      <input type="hidden" name="deliveryDriverName" value="${paymentDTO.deliveryDriverName}">
      <input type="hidden" name="imageUrl" value="${paymentDTO.imageUrl}">

    </form>

    <!-- 결제 버튼 -->
    <button type="button" onclick="handlePayment()">즉시결제</button>
  </main>

  <!-- 주문 내역 -->
  <aside class="order-summary">
    <h3>주문 내역 확인</h3>
    <img src="${paymentDTO.imageUrl}" width="200" height="200">
    <p>${paymentDTO.modelName}</p>
    <p>${paymentDTO.carNum}</p>
    <div>
      <div>${paymentDTO.manufactureYear}</div>
      <div>${paymentDTO.mileage}</div>
      <div>${paymentDTO.fuelType}</div>
    </div>

    <!-- 예상 결제 금액 -->
    <div class="payment-summary">
      <h3>예상 결제 금액</h3>
      <div class="payment-item"><span>차량가</span><span>${paymentDTO.carPrice}원</span></div>
      <div class="payment-item"><span>이전등록비</span><span>${paymentDTO.extendedWarrantyPrice}원</span></div>
      <div class="payment-item"><span>관리비용</span><span>${paymentDTO.maintenanceCost}원</span></div>
      <div class="payment-item"><span>배송비</span><span>${paymentDTO.deliveryFee}원</span></div>
      <div class="payment-item total"><span>합계</span><span>${paymentDTO.carAmountPrice}원</span></div>
    </div>
  </aside>
</div>

<!-- 계좌번호 안내창 모달창 -->
<div id="accountModal" style="display:none; position:fixed; top:50%; left:50%;  transform:translate(-50%, -50%);
      background:white; padding:20px; border-radius:10px; box-shadow: 0 0 10px rgba(0,0,0,0.3);">
  <p>계좌번호: <strong>123-4567-8901</strong></p>
  <button onclick="proceedToNextPage()">확인</button>
</div>
</body>
</html>
