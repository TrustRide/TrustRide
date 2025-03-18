<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>결제 수단 선택</title>
</head>
<body>
<div class="container">
  <!-- 결제 방법 선택 영역-->
  <main class="payment-section">
    <div>
      <h2>주문 내역 확인</h2>
      <h3>주문 내역을 확인하고 원하시는 결제 방법을 선택해주세요.</h3>
    </div>

    <div>
      <h3>결제방법</h3>
    </div>

    <div class="payment-buttons">
      <button type="button" onclick="selectPayment('현금')">현금</button>
      <button type="button" onclick="selectPayment('신용카드')">신용카드</button>
    </div>
    <form action="/gearshift/payment/detail" method="post">
      <!-- 선택한 결제 수단 -->
      <input type="hidden" name="select-payment" id="select-payment">

      <input type="hidden" name="carModel" value="아반뗴 하이브리드(CN7) HEV모던">
      <input type="hidden" name="carNumber" value="396고6358">
      <input type="hidden" name="model-year" value="17년식 1월식">
      <input type="hidden" name="mileage" value="142.221km">
      <input type="hidden" name="fuel" value="디젤">
      <input type="hidden" name="carPrice" value="100">
      <input type="hidden" name="registrationFee" value="100">
      <input type="hidden" name="managementFee" value="100">
      <input type="hidden" name="deliveryFee" value="100">
      <input type="hidden" name="totalPrice" value="500">


      <!-- 결제 버튼 -->
      <button type="submit">결제</button>

    </form>
  </main>
  <!-- 주문 내역 -->
  <aside class="order-summary">
    <h3>주문 내역 확인</h3>
    <img src="" width="100%">
    <p>아반뗴 하이브리드(CN7) HEV모던</p>
    <p>396고6358</p>
    <div>
      <div>17년식 1월식</div>
      <div>142.221km</div>
      <div>디젤</div>
    </div>

    <!-- 예상 결제 금액 -->
    <div class="payment-summary">
      <h3>예상 결제 금액</h3>
      <div class="payment-item"><span>차량가</span><span>20,000,000원</span></div>
      <div class="payment-item"><span>이전등록비</span><span>500,000원</span></div>
      <div class="payment-item"><span>관리비용</span><span>200,000원</span></div>
      <div class="payment-item"><span>배송비</span><span>100,000원</span></div>
      <div class="payment-item total"><span>합계</span><span>20,800,000원</span></div>
    </div>
  </aside>
</div>

<script>
  function selectPayment(method) {
    document.getElementById("select-payment").value = method;
  }
</script>
</body>
</html>
