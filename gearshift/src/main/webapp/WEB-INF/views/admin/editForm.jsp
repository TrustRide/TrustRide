<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>차량 수정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>차량 수정</h1>

<!-- 차량 수정 요청 (POST /cars/{carInfoId}/edit) -->
<form action="${pageContext.request.contextPath}/cars/${carDto.carInfoId}/edit" method="post">

  <!-- PK: carInfoId (hidden) -->
  <!-- hidden 필드는 화면에서 수정이 불가능하며, 그대로 전달됩니다. -->
  <input type="hidden" name="carInfoId" value="${carDto.carInfoId}" />

  <!-- 🚗 차량 기본 정보 -->
  <div>
    <label>제안 보고서 번호 (Offer Report Number)</label>
    <input name="offerReportNumber" type="text" value="${carDto.offerReportNumber}" required />
  </div>
  <div>
    <label>차량 식별 번호 (VIN Number)</label>
    <input name="vinNumber" type="text" value="${carDto.vinNumber}" required />
  </div>
  <div>
    <label>설명 (Description)</label>
    <input name="description" type="text" value="${carDto.description}" />
  </div>

  <!-- 🏷️ 대 / 중 / 소 카테고리 선택 (필수) -->
  <div>
    <label>대분류 (Large Category)</label>
    <select name="largeCateCode" id="largeCate" required>
      <option value="">대분류 선택</option>
      <c:forEach var="large" items="${largeCategories}">
        <option value="${large.cateCode}"
          ${large.cateCode == carDto.largeCateCode ? 'selected' : ''}>
            ${large.cateName}
        </option>
      </c:forEach>
    </select>
  </div>

  <div>
    <label>중분류 (Medium Category)</label>
    <select name="mediumCateCode" id="mediumCate" required>
      <option value="">중분류 선택</option>
    </select>
  </div>

  <div>
    <label>소분류 (Small Category)</label>
    <select name="smallCateCode" id="smallCate" required>
      <option value="">소분류 선택</option>
    </select>
  </div>

  <!-- 🚗 차량 상세 정보 -->
  <div>
    <label>모델명 (Model Name)</label>
    <input name="modelName" type="text" value="${carDto.modelName}" required />
  </div>
  <div>
    <label>주행 거리 (Mileage)</label>
    <input name="mileage" type="text" value="${carDto.mileage}" required />
  </div>
  <div>
    <label>엔진 배기량 (Engine Capacity)</label>
    <input name="engineCapacity" type="text" value="${carDto.engineCapacity}" />
  </div>
  <div>
    <label>연료 유형 (Fuel Type)</label>
    <input name="fuelType" type="text" value="${carDto.fuelType}" />
  </div>
  <div>
    <label>변속기 (Transmission)</label>
    <input name="transmission" type="text" value="${carDto.transmission}" />
  </div>
  <div>
    <label>색상 (Color)</label>
    <input name="color" type="text" value="${carDto.color}" />
  </div>

  <!-- 🚗 차량 가격 정보 -->
  <div>
    <label>차량 가격 (Car Price)</label>
    <input name="carPrice" type="number" value="${carDto.carPrice}" required />
  </div>
  <div>
    <label>차량 번호 (Car Num)</label>
    <input name="carNum" type="text" value="${carDto.carNum}" />
  </div>
  <div>
    <label>총 차량 금액 (Car Amount Price)</label>
    <input name="carAmountPrice" type="number" value="${carDto.carAmountPrice}" />
  </div>

  <!-- 🖼️ 이미지 입력 (이미 있으면 수정/재입력 가능) -->
  <div>
    <label>이미지 업로드</label>
    <c:forEach var="img" items="${carDto.images}" varStatus="i">
      <input type="text"
             name="images[${i.index}].imageUrl"
             value="${img.imageUrl}"
             placeholder="이미지 URL" />
      <input type="text"
             name="images[${i.index}].imageType"
             value="${img.imageType}"
             placeholder="이미지 유형" />
    </c:forEach>
  </div>

  <button type="submit">차량 수정</button>
</form>

<!-- 대분류/중분류/소분류 AJAX 로딩 스크립트 -->
<script>
  $(document).ready(function() {
    // 대분류 변경 시 중분류 목록 로드
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

    // 중분류 변경 시 소분류 목록 로드
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

    // ★ 기존 데이터 로드 (중/소 분류) - 수정 페이지 진입 시 자동으로 세팅
    var selectedMediumCate = "${carDto.mediumCateCode}";
    var selectedSmallCate = "${carDto.smallCateCode}";

    // if문으로 대분류 값이 있을 때 중분류를 미리 로딩
    if ($('#largeCate').val()) {
      $.get('${pageContext.request.contextPath}/cars/categories/medium?parentCode=' + $('#largeCate').val(), function(data) {
        $.each(data, function(index, item) {
          $('#mediumCate').append(
                  '<option value="' + item.cateCode + '"' +
                  (item.cateCode === selectedMediumCate ? ' selected' : '') +
                  '>' + item.cateName + '</option>');
        });

        // 중분류가 미리 선택되어 있다면 소분류도 로딩
        if (selectedMediumCate) {
          $.get('${pageContext.request.contextPath}/cars/categories/small?parentCode=' + selectedMediumCate, function(data) {
            $.each(data, function(index, item) {
              $('#smallCate').append(
                      '<option value="' + item.cateCode + '"' +
                      (item.cateCode === selectedSmallCate ? ' selected' : '') +
                      '>' + item.cateName + '</option>');
            });
          });
        }
      });
    }
  });
</script>
</body>
</html>
