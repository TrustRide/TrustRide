<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>차량 수정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>차량 수정 폼</h1>

<form action="${pageContext.request.contextPath}/cars/${carDto.carInfoId}/edit" method="post" enctype="multipart/form-data">

  <input type="hidden" name="carInfoId" value="${carDto.carInfoId}" />

  <!-- 차량 기본 정보 -->
  <div>
    <label>제안 보고서 번호 (offerReportNumber)</label>
    <input name="offerReportNumber" type="text" value="${carDto.offerReportNumber}" required />
  </div>
  <div>
    <label>차량 식별 번호 (vinNumber)</label>
    <input name="vinNumber" type="text" value="${carDto.vinNumber}" required />
  </div>
  <div>
    <label>설명 (description)</label>
    <input name="description" type="text" value="${carDto.description}" />
  </div>

  <!-- 대 / 중 / 소 카테고리 선택 -->
  <div>
    <label>대분류 (largeCateCode)</label>
    <select name="largeCateCode" id="largeCate" required>
      <option value="">대분류 선택</option>
      <c:forEach var="large" items="${largeCategories}">
        <option value="${large.cateCode}">${large.cateName}</option>
      </c:forEach>
    </select>
  </div>
  <div>
    <label>중분류 (mediumCateCode)</label>
    <select name="mediumCateCode" id="mediumCate" required>
      <option value="">중분류 선택</option>
      <!-- AJAX로 채워질 영역 -->
    </select>
  </div>
  <div>
    <label>소분류 (smallCateCode)</label>
    <select name="smallCateCode" id="smallCate" required>
      <option value="">소분류 선택</option>
      <!-- AJAX로 채워질 영역 -->
    </select>
  </div>

  <!-- 차량 상세 정보 -->
  <div>
    <label>모델명 (modelName)</label>
    <input name="modelName" type="text" value="${carDto.modelName}" required />
  </div>
  <div>
    <label>주행 거리 (mileage)</label>
    <input name="mileage" type="text" value="${carDto.mileage}" required />
  </div>
  <div>
    <label>엔진 배기량 (engineCapacity)</label>
    <input name="engineCapacity" type="text" value="${carDto.engineCapacity}" />
  </div>
  <div>
    <label>연료 유형 (fuelType)</label>
    <input name="fuelType" type="text" value="${carDto.fuelType}" />
  </div>
  <div>
    <label>변속기 (transmission)</label>
    <input name="transmission" type="text" value="${carDto.transmission}" />
  </div>
  <div>
    <label>색상 (color)</label>
    <input name="color" type="text" value="${carDto.color}" />
  </div>
  <div>
    <label>제조 연도 (manufactureYear)</label>
    <input name="manufactureYear" type="text" value="${carDto.manufactureYear}" />
  </div>
  <div>
    <label>이전 등록비 (previousRegistrationFee)</label>
    <input name="previousRegistrationFee" type="number" value="${carDto.previousRegistrationFee}" />
  </div>
  <div>
    <label>유지보수 비용 (maintenanceCost)</label>
    <input name="maintenanceCost" type="number" value="${carDto.maintenanceCost}" />
  </div>
  <div>
    <label>등록대행 수수료 (agencyFee)</label>
    <input name="agencyFee" type="number" value="${carDto.agencyFee}" />
  </div>
  <div>
    <label>차량 위치 (carLocation)</label>
    <input name="carLocation" type="text" value="${carDto.carLocation}" />
  </div>
  <div>
    <label>소유주 변경 횟수 (ownerChangeCount)</label>
    <input name="ownerChangeCount" type="number" value="${carDto.ownerChangeCount}" />
  </div>

  <!-- 가격 정보 -->
  <div>
    <label>차량 가격 (carPrice)</label>
    <input name="carPrice" type="number" value="${carDto.carPrice}" required />
  </div>
  <div>
    <label>차량 번호 (carNum)</label>
    <input name="carNum" type="text" value="${carDto.carNum}" />
  </div>
  <div>
    <label>총 차량 금액 (carAmountPrice)</label>
    <input name="carAmountPrice" type="number" value="${carDto.carAmountPrice}" />
  </div>
  <div>
    <label>판매 여부 (soldStatus)</label>
    <input name="soldStatus" type="text" value="${carDto.soldStatus}" />
  </div>

  <!-- 이미지 업로드 -->
  <div>
    <label>새 이미지 파일 첨부</label><br/>
    <input type="file" name="imageFiles" multiple />
  </div>

  <button type="submit">차량 수정</button>
</form>

<script>
  $(document).ready(function () {
    // 대분류 선택 시 중분류 로드
    $('#largeCate').change(function () {
      const largeCateCode = $(this).val();
      $('#mediumCate').html('<option value="">중분류 선택</option>');
      $('#smallCate').html('<option value="">소분류 선택</option>');

      if (largeCateCode) {
        $.get('${pageContext.request.contextPath}/cars/categories/medium?parentCode=' + largeCateCode, function (data) {
          $.each(data, function (index, item) {
            $('#mediumCate').append('<option value="' + item.cateCode + '">' + item.cateName + '</option>');
          });
        });
      }
    });

    // 중분류 선택 시 소분류 로드
    $('#mediumCate').change(function () {
      const mediumCateCode = $(this).val();
      $('#smallCate').html('<option value="">소분류 선택</option>');

      if (mediumCateCode) {
        $.get('${pageContext.request.contextPath}/cars/categories/small?parentCode=' + mediumCateCode, function (data) {
          $.each(data, function (index, item) {
            $('#smallCate').append('<option value="' + item.cateCode + '">' + item.cateName + '</option>');
          });
        });
      }
    });
  });

</script>
</body>
</html>
