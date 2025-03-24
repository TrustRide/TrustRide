<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>리뷰 작성</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/review/userReview.css">
</head>
<body>

    <div class="review-summary">
        <div>리뷰 작성</div>
    </div>

    <div class="product-list">

        <c:forEach var="order" items="${orders}">
            <div class="product ${order.reviewStatus == 'Y' ? 'reviewed' : ''}">
                <div class="product-info">
                    <img src="https://cdn-icons-png.flaticon.com/512/5824/5824631.png" alt="${order.modelName} 이미지" class="product-img" />
                    <div class="product-text">
                        <div class="product-name">${order.modelName}</div>
                        <div class="product-date">${order.orderCompletedDate} 배송</div>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${order.reviewStatus == 'Y'}">
                        <div class="button-group">
                            <button class="view-button open-modal-btn"
                                    onclick="openModal(this)"
                                    data-title="${order.review.reviewTitle}"
                                    data-rating="${order.review.rating}"
                                    data-content="${order.review.reviewContent}"
                                    data-date="${order.review.formattedCreatedAt}" data-img="${pageContext.request.contextPath}/img/review/car1.jpg">
                            리뷰 보기
                            </button>
                            <form action="${pageContext.request.contextPath}/mypage/review/delete/${order.orderId}" method="post">
                                <button class="delete-button">리뷰 삭제</button>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.request.contextPath}/mypage/review/register" method="post">
                            <input type="hidden" name="orderId" value="${order.orderId}" />
                            <input type="hidden" name="carInfoId" value="${order.carInfoId}" />
                            <input type="hidden" name="modelName" value="${order.modelName}" />
                            <input type="hidden" name="orderCompletedDate" value="${order.orderCompletedDate}" />
                            <button type="submit" class="review-button">리뷰 작성하기</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>

    </div>

    <!-- 모달창 -->
    <div class="modal-overlay" id="modalOverlay" onclick="closeModal(event)">
        <div class="modal" onclick="event.stopPropagation()">
            <button class="close-btn" onclick="closeModal(event)">×</button>
            <br>
            <div class="image-container">
                <img id="modalImage" src="" alt="리뷰 이미지">
            </div>

            <div class="title" id="modalTitle"></div>

            <div class="stars" id="modalStars"></div>

            <div class="meta-info">
                <span class="timestamp" id="modalDate"></span>
            </div>

            <div class="description" id="modalContent"></div>

            <div class="comment-section comment-list">
                <div class="comment">
                    <div class="author">관리자</div>
                    <div class="text">감사합니다.</div>
                </div>
            </div>
        </div>
    </div>


    <script>
        <c:if test="${not empty message}">
            alert("${message}");
        </c:if>

        function openModal(button) {
            const title = button.dataset.title;
            const rating = parseInt(button.dataset.rating || "0");
            const content = button.dataset.content;
            const date = button.dataset.date;
            const img = button.dataset.img;

            let stars = '';
            for (let i = 1; i <= 5; i++) {
                stars += i <= rating ? '★' : '☆';
            }

            document.getElementById('modalTitle').textContent = title;
            document.getElementById('modalStars').innerHTML = stars;
            document.getElementById('modalContent').textContent = content;
            document.getElementById('modalDate').textContent = date;
            document.getElementById('modalImage').src = img;

            document.getElementById('modalOverlay').style.display = 'flex';
        }

        function closeModal(event) {
            document.getElementById('modalOverlay').style.display = 'none';
        }
    </script>
</body>
</html>
