<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>차량 목록</title>
    <meta charset="UTF-8"/>
    <script>
        function confirmDelete(carInfoId) {
            if (confirm('정말 삭제하시겠습니까?')) {
                window.location.href = '${pageContext.request.contextPath}/cars/' + carInfoId + '/delete';
            }
        }
    </script>
</head>
<body>
<h1> 차량 목록</h1>

<!-- 차량 등록 페이지로 이동 -->
<a href="${pageContext.request.contextPath}/cars/register">+ 차량 등록</a>

<!-- 차량 목록 테이블 -->
<table border="1">
    <thead>
    <tr>
        <th>carInfoId<br/>(차량 ID)</th>
        <th>offerReportNumber<br/>(제안서 번호)</th>
        <th>vinNumber<br/>(차대 번호)</th>
        <th>description<br/>(설명)</th>
        <th>largeCateCode<br/>(대분류 코드)</th>
        <th>mediumCateCode<br/>(중분류 코드)</th>
        <th>smallCateCode<br/>(소분류 코드)</th>
        <th>modelName<br/>(모델명)</th>
        <th>mileage<br/>(주행 거리)</th>
        <th>engineCapacity<br/>(배기량)</th>
        <th>fuelType<br/>(연료)</th>
        <th>transmission<br/>(변속기)</th>
        <th>color<br/>(색상)</th>
        <th>manufactureYear<br/>(제조 연도)</th>
        <th>previousRegistrationFee<br/>(이전 등록비)</th>
        <th>maintenanceCost<br/>(유지비)</th>
        <th>agencyFee<br/>(연장 보증비)</th>
        <th>carLocation<br/>(위치)</th>
        <th>ownerChangeCount<br/>(소유 변경 수)</th>
        <th>carPrice<br/>(차량 가격)</th>
        <th>carNum<br/>(차량 번호)</th>
        <th>carAmountPrice<br/>(총 차량 금액)</th>
        <th>soldStatus<br/>(판매상태)</th>

        <th>Images<br/>(이미지 정보)</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="car" items="${carList}">
        <tr>
            <td>${car.carInfoId}</td>
            <td>${car.offerReportNumber}</td>
            <td>${car.vinNumber}</td>
            <td>${car.description}</td>
            <td>${car.largeCateCode}</td>
            <td>${car.mediumCateCode}</td>
            <td>${car.smallCateCode}</td>
            <td>${car.modelName}</td>
            <td>${car.mileage}</td>
            <td>${car.engineCapacity}</td>
            <td>${car.fuelType}</td>
            <td>${car.transmission}</td>
            <td>${car.color}</td>
            <td>${car.manufactureYear}</td>
            <td>${car.previousRegistrationFee}</td>
            <td>${car.maintenanceCost}</td>
            <td>${car.agencyFee}</td>
            <td>${car.carLocation}</td>
            <td>${car.ownerChangeCount}</td>
            <td>${car.carPrice}</td>
            <td>${car.carNum}</td>
            <td>${car.carAmountPrice}</td>
            <td>${car.soldStatus}</td>


            <td>
                <c:if test="${not empty car.thumbnailUrl}">
                    <img src="${pageContext.request.contextPath}${car.thumbnailUrl}" width="100" height="70" alt="썸네일" />
                </c:if>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/cars/${car.carInfoId}/edit">수정</a>
            </td>
            <td>
                <a href="javascript:void(0);" onclick="confirmDelete('${car.carInfoId}');">삭제</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>