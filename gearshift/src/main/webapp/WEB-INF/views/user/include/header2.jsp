<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header>
    <div class="container header-content">
        <div class="logo-container">
            <a href="${pageContext.request.contextPath}">
                <img src="<c:url value='/resources/img/logo-orange.png' />" alt="Trust Ride Logo" class="logo-img">
            </a>
            <h1 class="logo">Trust Ride</h1>
        </div>

        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/userList">내차사기</a></li>
                <li><a href="${pageContext.request.contextPath}/review">상품리뷰</a></li>

                <c:if test="${not empty sessionScope.loginUser}">
                    <li><strong>${sessionScope.loginUser.userName}</strong>님 환영합니다.</li>
                    <li><a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                </c:if>


                <c:if test="${empty sessionScope.loginUser}">
                    <li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
                    <li><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
                </c:if>

            </ul>
        </nav>

        <form action="/gearshift/searchCar" method="get" style="display: flex; align-items: center;">
            <input type="text" name="searchQuery" placeholder="🔍차량을 검색하세요." class="search-bar" style="padding: 10px; border-radius: 4px; border: 1px solid #ddd; flex: 1;">
            <button type="submit" class="search-btn">검색</button>
        </form>
    </div>

    <form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post" style="display:none;">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>

</header>
