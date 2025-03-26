<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${car.modelName} 상세 정보</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Pretendard', sans-serif;
      background-color: #f8f9fa;
    }
    .container {
      max-width: 900px;
      margin: 60px auto;
      padding: 30px;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.08);
    }
    .car-image {
      width: 100%;
      max-height: 400px;
      object-fit: cover;
      border-radius: 10px;
      margin-bottom: 30px;
    }
    .car-info h1 {
      font-size: 28px;
      margin-bottom: 10px;
    }
    .car-info h3 {
      color: #666;
      margin-bottom: 20px;
    }
    .info-list p {
      font-size: 16px;
      margin: 8px 0;
    }
    .back-btn {
      display: inline-block;
      margin-top: 30px;
      background-color: #ff6f00;
      color: white;
      padding: 10px 20px;
      border-radius: 8px;
      text-decoration: none;
      transition: background-color 0.3s;
    }
    .back-btn:hover {
      background-color: #e65c00;
    }
  </style>
</head>
<body>

<div class="container">
  <!-- 썸네일 이미지 출력 -->
  <c:if test="${not empty car.thumbnailUrl}">
    <img src="${pageContext.request.contextPath}${car.thumbnailUrl}" alt="차량 썸네일" class="car-image">
  </c:if>

  <div class="car-info">
    <h1>${car.modelName}</h1>
    <h3>${car.manufactureYear}년식 · ${car.mileage}km · ${car.fuelType}</h3>
  </div>


  <div class="info-list">
    <p><strong>차량 번호:</strong> ${car.carNum}</p>
    <p><strong>차량 코드:</strong> ${car.carInfoId}</p>
    <p><strong>카테고리:</strong> ${car.largeCateName} > ${car.mediumCateName} > ${car.smallCateName}</p>
    <p><strong>색상:</strong> ${car.color}</p>
    <p><strong>변속기:</strong> ${car.transmission}</p>
    <p><strong>배기량:</strong> ${car.engineCapacity}</p>
    <p><strong>위치:</strong> ${car.carLocation}</p>
    <p><strong>소유주 변경 횟수:</strong> ${car.ownerChangeCount}</p>
    <p><strong>판매 상태:</strong> ${car.soldStatus}</p>
    <p><strong>설명:</strong> ${car.description}</p>
    <p><strong>차량 가격:</strong> <fmt:formatNumber value="${car.carPrice}" type="number" /> 원</p>
    <p><strong>총 차량 금액:</strong> <fmt:formatNumber value="${car.carAmountPrice}" type="number" /> 원</p>
  </div>

  <a href="${pageContext.request.contextPath}/admin/cars" class="back-btn">← 목록으로 돌아가기</a>
</div>

</body>
</html>
