<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품리뷰</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/review/review.css">
</head>
<body>
    <h1 style="text-align:center;">솔직한 이용 후기</h1>
    <br>
    <div class="container">
        <c:forEach var="r" items="${reviews}">
            <div class="card">
                <a href="${pageContext.request.contextPath}/review/${r.reviewId}?page=${paging.page}"><img src="${pageContext.request.contextPath}/img/review/car1.jpg" alt="차 리뷰 ${r.reviewId}"></a>
                <a href="${pageContext.request.contextPath}/review/${r.reviewId}?page=${paging.page}"><h3>${r.reviewTitle}</h3></a>
                <p>${r.reviewContent}</p>
            </div>
        </c:forEach>
    </div>
    <br><br>
    <div class="pagination">
        <c:if test="${paging.hasPrev}">
            <a href="?page=${paging.startPage - 1}">&lt;</a>
        </c:if>

        <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
            <a href="?page=${i}" class="${i == paging.page ? 'active' : ''}">${i}</a>
        </c:forEach>

        <c:if test="${paging.hasNext}">
            <a href="?page=${paging.endPage + 1}">&gt;</a>
        </c:if>
    </div>
</body>
</html>