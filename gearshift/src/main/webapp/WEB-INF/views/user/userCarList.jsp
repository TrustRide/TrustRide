<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>상품 리스트</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/user/userCarList.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/header2.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/user/footer2.css' />">

</head>
<body>

<!-- 🔷 헤더 영역 -->
<%@ include file="/WEB-INF/views/user/include/header2.jsp" %>


<!-- 🔶 메인 콘텐츠 영역 -->
<main>

    <!-- 🔹 배너 영역 -->
    <section class="banner">
        내 차 20만원 할인 받는 법!
    </section>

    <!-- 🔹 차량 리스트와 카테고리 필터 레이아웃 -->
    <section class="car-page-layout">

        <!-- 왼쪽 카테고리 필터 -->
        <aside class="category-container">
            <h2>국산·수입 제조사/모델</h2>
            <ul class="category-list">
                <c:forEach var="cate" items="${cateList}">
                    <c:choose>
                        <c:when test="${cate.tier == 1}">
                            <li class="category-tier-1" onclick="toggleCategory('tier2-${cate.cateCode}')">${cate.cateName}</li>
                            <ul id="tier2-${cate.cateCode}" class="hidden category-list"></ul>
                        </c:when>
                        <c:when test="${cate.tier == 2}">
                            <c:set var="parentId" value="tier2-${cate.cateParent}" />
                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    var parentElement = document.getElementById("${parentId}");
                                    if (parentElement) {
                                        parentElement.innerHTML += '<li class="category-tier-2" onclick="toggleCategory(\'tier3-${cate.cateCode}\')">${cate.cateName}</li>' +
                                            '<ul id="tier3-${cate.cateCode}" class="hidden category-list"></ul>';
                                    }
                                });
                            </script>
                        </c:when>
                        <c:when test="${cate.tier == 3}">
                            <c:set var="parentId" value="tier3-${cate.cateParent}" />
                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    var parentElement = document.getElementById("${parentId}");
                                    if (parentElement) {
                                        parentElement.innerHTML += '<li class="category-tier-3">' +
                                            '<a href="${pageContext.request.contextPath}/userList?cateCode=${cate.cateCode}" style="text-decoration:none; color:#333;">${cate.cateName}</a>' +
                                            '</li>';
                                    }
                                });
                            </script>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </ul>
        </aside>

        <!-- 오른쪽 차량 리스트 -->
        <section class="car-section">
            <h2>홈서비스 타임딜</h2>
            <div class="car-grid">
                <c:forEach var="car" items="${userCarList}">
                    <div class="car-card">
                        <a href="/gearshift/carDetail?carInfoId=${car.carInfoId}" class="car-card">
                            <c:choose>
                                <c:when test="${not empty car.thumbnailUrl}">
                                    <img src="${pageContext.request.contextPath}${car.thumbnailUrl}" alt="Car Image">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/resources/img/자동차7.png" alt="기본 이미지">
                                </c:otherwise>
                            </c:choose>
                            <div class="car-card-content">
                                <h2>${car.modelName}</h2>
                                <h4>${car.manufactureYear}년식 · ${car.mileage}km · ${car.fuelType}</h4>
                                <h1><fmt:formatNumber value="${car.carPrice}" type="number" />만원</h1>
                            </div>
                        </a>

                        <div style="text-align: center; margin: 10px 0;">
                            <c:choose>
                                <c:when test="${car.isWished}">
                                    <form action="${pageContext.request.contextPath}/wishlist/remove" method="post">
                                        <input type="hidden" name="carInfoId" value="${car.carInfoId}" />
                                        <button type="submit" style="background: none; border: none; color: red; font-size: 20px;">
                                            ❤️ 찜 해제
                                        </button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form action="${pageContext.request.contextPath}/wishlist/add" method="post">
                                        <input type="hidden" name="carInfoId" value="${car.carInfoId}" />
                                        <button type="submit" style="background: none; border: none; font-size: 20px;">
                                            🤍 찜하기
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 🔹 페이지네이션 -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="/gearshift/userList?page=${currentPage - 1}">« 이전</a>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="page">
                    <a href="/gearshift/userList?page=${page}" class="${currentPage == page ? 'active' : ''}">${page}</a>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="/gearshift/userList?page=${currentPage + 1}">다음 »</a>
                </c:if>
            </div>
        </section>
    </section>
</main>

<!-- 🔷 푸터 -->
<%@ include file="/WEB-INF/views/user/include/footer2.jsp" %>

<!-- 🔷 JS: 카테고리 토글 -->
<script>
    function toggleCategory(id) {
        var element = document.getElementById(id);
        if (element) {
            element.classList.toggle("hidden");
        }
    }
</script>

</body>
</html>
