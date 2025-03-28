<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 상세</title>
</head>
<body>
<h2>문의 상세</h2>

<p><strong>문의 ID:</strong> ${inquiry.inquiryId}</p>
<p><strong>제목:</strong> ${inquiry.inquiryName}</p>
<p><strong>모델명:</strong> ${inquiry.modelName}</p>
<p><strong>문의 유형:</strong> ${inquiry.inquiryType}</p>
<p><strong>문의 내용:</strong><br/> ${inquiry.inquiryContent}</p>
<p><strong>작성자:</strong> ${inquiry.userName}</p>
<p><strong>상태:</strong>
    <span style="color: ${inquiry.inquiryStatus eq '처리완료' ? 'green' : 'orange'};">
        ${inquiry.inquiryStatus}
    </span>
</p>
<p><strong>작성일:</strong> ${inquiry.createdAt}</p>
<p><strong>수정일:</strong> ${inquiry.updatedAt}</p>

<h3>관리자 답변</h3>

<c:if test="${not empty inquiry.comments}">
    <c:forEach var="comment" items="${inquiry.comments}">
        <div style="border:1px solid #ccc; padding:10px; margin-bottom:5px">
            <p>${comment.commentContent}</p>
            <small>작성일: ${comment.createdAt}</small>
        </div>
    </c:forEach>
</c:if>

<c:if test="${empty inquiry.comments}">
    <p>아직 관리자의 답변이 없습니다.</p>
</c:if>



<br/>
<a href="${pageContext.request.contextPath}/user/inquiry">← 목록으로</a>
</body>
</html>
