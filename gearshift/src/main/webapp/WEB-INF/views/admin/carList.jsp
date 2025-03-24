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
<h1>차량 목록</h1>

<!-- 차량 등록 페이지로 이동 -->
<a href="${pageContext.request.contextPath}/cars/register">차량 등록</a>

<!-- 차량 목록 테이블 -->
<table border="1">
    <thead>
    <tr>
        <th>carInfoId</th>
        <th>offerReportNumber</th>
        <th>vinNumber</th>
        <th>description</th>
        <th>subCategoryId</th>
        <th>modelName</th>
        <th>mileage</th>
        <th>engineCapacity</th>
        <th>fuelType</th>
        <th>transmission</th>
        <th>color</th>
        <th>manufactureYear</th>
        <th>previousRegistrationFee</th>
        <th>maintenanceCost</th>
        <th>extendedWarrantyPrice</th>
        <th>carLocation</th>
        <th>ownerChangeCount</th>
        <th>carPrice</th>
        <th>carNum</th>
        <th>carAmountPrice</th>
        <th>Images</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <!-- 차량 목록 반복 출력 -->
    <c:forEach var="car" items="${carList}">
        <tr>
            <td>${car.carInfoId}</td>
            <td>${car.offerReportNumber}</td>
            <td>${car.vinNumber}</td>
            <td>${car.description}</td>
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

            <!-- 이미지 리스트 (중첩 루프) -->
            <td>
                <ul>
                    <c:forEach var="img" items="${car.images}">
                        <li>${img.imageUrl} (${img.imageType})</li>
                    </c:forEach>
                </ul>
            </td>

            <!-- 수정 및 삭제 버튼 -->
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