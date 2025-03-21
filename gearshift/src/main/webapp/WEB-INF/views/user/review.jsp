<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품리뷰</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/review.css">
</head>
<body>
    <h1 style="text-align:center;">솔직한 이용 후기</h1>
    <div class="container">
        <div class="card">
            <img src="${pageContext.request.contextPath}/img/review/car1.jpg" alt="차 리뷰 1" style="width: 100%; height: 180px; object-fit: cover;">
            <h3>리뷰 제목 컬럼 만들기</h3>
            <p>이 차는 최고의 성능을 제공합니다.</p>
        </div>
    </div>
    <div class="pagination">
        <a href="#">&lt;</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">&gt;</a>
    </div>
</body>
</html>