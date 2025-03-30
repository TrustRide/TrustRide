<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .logout-btn {
        background: none;
        border: none;
        cursor: pointer;
        font: inherit;
        padding: 0;
    }
</style>
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
                    <li>
                        <form id="logoutForm" method="POST" action="${pageContext.request.contextPath}/logout" style="display:inline;">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="logout-btn">로그아웃</button>
                        </form>
                    </li>
                </c:if>

                <c:if test="${empty sessionScope.loginUser}">
                    <li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
                    <li><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
                </c:if>
            </ul>
        </nav>

        <!-- 검색 input, form 없이 처리 -->
<c:if test="${not hideSearch}">
        <div style="display: flex; align-items: center;">
            <input type="text" id="searchQuery" placeholder="🔍차량을 검색하세요." class="search-bar"
                   style="padding: 10px; border-radius: 4px; border: 1px solid #ddd; flex: 1;"
                   onkeypress="if(event.key === 'Enter') searchCar()">
            <button type="button" class="search-btn" onclick="searchCar()">검색</button>
        </div>
</c:if>
    </div>
</header>

<script>
    // 검색 기능 (form 없이 GET 요청 전송)
    function searchCar() {
        const query = document.getElementById('searchQuery').value.trim();
        if (query !== '') {
            const url = '${pageContext.request.contextPath}/searchCar?searchQuery=' + encodeURIComponent(query);
            window.location.href = url;
        }
    }
</script>
