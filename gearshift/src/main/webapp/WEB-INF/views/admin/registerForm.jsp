<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>차량 등록</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>차량 등록 폼</h1>

<!-- 차량 등록 요청 -->
<form action="${pageContext.request.contextPath}/cars/register" method="post">

  <!-- 🚗 차량 기본 정보 입력 -->
  <div>
    <label>제안 보고서 번호 (Offer Report Number)</label>
    <input name="offerReportNumber" type="text" required />
  </div>
  <div>
    <label>차량 식별 번호 (VIN Number)</label>
    <input name="vinNumber" type="text" required />
  </div>
  <div>
    <label>설명 (Description)</label>
    <input name="description" type="text" />
  </div>

  <!-- 🏷️ 대 / 중 / 소 카테고리 선택 (필수) -->
  <div>
    <label>대분류 (Large Category)</label>
    <!-- required 추가 -->
    <select name="largeCateCode" id="largeCate" required>
      <option value="">대분류 선택</option>
      <c:forEach var="large" items="${largeCategories}">
        <option value="${large.cateCode}">${large.cateName}</option>
      </c:forEach>
    </select>
  </div>

  <div>
    <label>중분류 (Medium Category)</label>
    <!-- required 추가 -->
    <select name="mediumCateCode" id="mediumCate" required>
      <option value="">중분류 선택</option>
    </select>
  </div>

  <div>
    <label>소분류 (Small Category)</label>
    <!-- required 추가 -->
    <select name="smallCateCode" id="smallCate" required>
      <option value="">소분류 선택</option>
    </select>
  </div>

  <!-- 🚗 차량 상세 정보 -->
  <div>
    <label>모델명 (Model Name)</label>
    <input name="modelName" type="text" required />
  </div>
  <div>
    <label>주행 거리 (Mileage)</label>
    <input name="mileage" type="text" required />
  </div>
  <div>
    <label>엔진 배기량 (Engine Capacity)</label>
    <input name="engineCapacity" type="text" />
  </div>
  <div>
    <label>연료 유형 (Fuel Type)</label>
    <input name="fuelType" type="text" />
  </div>
  <div>
    <label>변속기 (Transmission)</label>
    <input name="transmission" type="text" />
  </div>
  <div>
    <label>색상 (Color)</label>
    <input name="color" type="text" />
  </div>

  <!-- 🚗 차량 가격 정보 -->
  <div>
    <label>차량 가격 (Car Price)</label>
    <input name="carPrice" type="number" required />
  </div>
  <div>
    <label>차량 번호 (Car Num)</label>
    <input name="carNum" type="text" />
  </div>
  <div>
    <label>총 차량 금액 (Car Amount Price)</label>
    <input name="carAmountPrice" type="number" />
  </div>

  <!-- 🖼️ 이미지 입력 -->
  <div>
    <label>이미지 업로드</label>
    <!-- 새로 등록 시, carDto.images가 비어 있을 수 있으므로 안전하게 루프 -->
    <c:forEach var="img" items="${carDto.images}" varStatus="i">
      <input type="text" name="images[${i.index}].imageUrl" placeholder="이미지 URL" />
      <input type="text" name="images[${i.index}].imageType" placeholder="이미지 유형" />
    </c:forEach>
  </div>

  <button type="submit">차량 등록</button>
</form>

<script>
  $(document).ready(function() {
    // 중분류 로드
    $('#largeCate').change(function() {
      var largeCateCode = $(this).val();
      $('#mediumCate').html('<option value="">중분류 선택</option>');
      $('#smallCate').html('<option value="">소분류 선택</option>');

      if (largeCateCode) {
        $.get('${pageContext.request.contextPath}/cars/categories/medium?parentCode=' + largeCateCode, function(data) {
          $.each(data, function(index, item) {
            $('#mediumCate').append('<option value="' + item.cateCode + '">' + item.cateName + '</option>');
          });
        });
      }
    });

    // 소분류 로드
    $('#mediumCate').change(function() {
      var mediumCateCode = $(this).val();
      $('#smallCate').html('<option value="">소분류 선택</option>');

      if (mediumCateCode) {
        $.get('${pageContext.request.contextPath}/cars/categories/small?parentCode=' + mediumCateCode, function(data) {
          $.each(data, function(index, item) {
            $('#smallCate').append('<option value="' + item.cateCode + '">' + item.cateName + '</option>');
          });
        });
      }
    });
  });
</script>
</body>
</html>
