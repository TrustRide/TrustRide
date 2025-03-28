<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/styles.css">
</head>
<body>

<!-- 헤더 포함 -->
<jsp:include page="include/header.jsp"/>

<!-- 사이드바 포함 -->
<jsp:include page="include/sidebar.jsp"/>
<table border="1">
    <tr>
        <th>처리상태</th>
        <td>
            <c:choose>
                <c:when test="${inquiry.inquiryStatus eq '처리완료'}">
                    ✅ <span style="color:green; font-weight:bold;">${inquiry.inquiryStatus}</span>
                </c:when>
                <c:otherwise>
                    ⏳ <span style="color:orange; font-weight:bold;">${inquiry.inquiryStatus}</span>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

    <tr><th>제목</th><td>${inquiry.inquiryName}</td></tr>
    <tr><th>문의내용</th><td>${inquiry.inquiryContent}</td></tr>
    <tr><th>유형</th><td>${inquiry.inquiryType}</td></tr>
    <tr><th>회원명</th><td>${inquiry.userName}</td></tr>
    <tr><th>이메일</th><td>${inquiry.userEmail}</td></tr>
    <tr><th>상품명</th><td>${inquiry.modelName}</td></tr>
    <tr><th>작성일시</th><td>${inquiry.createdAt}</td></tr>
</table>

<h3>답변</h3>
<c:forEach var="comment" items="${commentList}">
    <div style="border:1px solid #ccc; padding:10px; margin-bottom:5px">
        <p>${comment.commentContent}</p>
        <small>${comment.createdAt}</small>
    </div>
</c:forEach>

<form method="post" action="${pageContext.request.contextPath}/admin/inquiry/reply">
    <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}" />
    <textarea name="commentContent" rows="5" cols="50" required></textarea><br/>
    <button type="submit">등록하기</button>
</form>

<form method="get" action="${pageContext.request.contextPath}/admin/inquiry">
    <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}" />
    <button type="submit">목록으로</button>

<form method="post" action="${pageContext.request.contextPath}/admin/inquiry/delete">
    <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}" />
    <button type="submit">삭제</button>
</form>
</body>
</html>