<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/styles.css">
<header class="header">
    <div class="logo">🛠️ 관리자 페이지</div>
    <div class="user-info">
        <span>${sessionScope.adminUser.adminName} 님</span>
        <a href="${pageContext.request.contextPath}/logout"><button class="logout-btn">로그아웃</button></a>
    </div>
</header>
