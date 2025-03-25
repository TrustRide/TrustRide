<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>차량리뷰 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/review/reviewDetail.css">
</head>
<body>
    <c:set var="r" value="${review}" />
    <div class="container">
        <div class="image-container">
            <img src="${pageContext.request.contextPath}/img/review/car1.jpg" alt="차량리뷰 상세이미지">
        </div>

        <div class="title-row">
            <div class="title">${r.reviewTitle}</div>
            <div class="stars">
                <c:forEach var="i" begin="1" end="5">
                    <c:choose>
                        <c:when test="${i <= r.rating}">★</c:when>
                        <c:otherwise>☆</c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>

        <div class="meta-info">
            <span class="writer">${r.userName}</span>
            <span class="timestamp">${r.formattedCreatedAt}</span>
        </div>

        <div class="description">
            ${r.reviewContent}
        </div>

        <div class="comment-section">
            <div class="comment-list">
                <div class="comment">
                    <div class="comment-header">
                        <div class="author">관리자</div>
                        <div class="comment-time meta-info">2025.03.22 16:35</div>
                    </div>
                    <div class="text">차가 마음에 드셨다니 저희도 기쁩니다. 소중한 리뷰 감사합니다 고객님~</div>
                </div>
            </div>
            <div>
                <div class="button-wrapper">
                    <a href="${pageContext.request.contextPath}/review?page=${page}"><button class="back-link">← 목록으로 돌아가기</button></a>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
