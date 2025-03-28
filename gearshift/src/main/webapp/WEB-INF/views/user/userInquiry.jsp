<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 목록</title>
</head>
<body>
<h2>문의 목록</h2>
<a href="${pageContext.request.contextPath}/user/inquiry/write">새 문의 작성</a>
<br/><br/>
<table border="1" cellpadding="8">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>문의유형</th>
        <th>작성자</th>
        <th>상태</th>
        <th>작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="inq" items="${inquiryList}">
        <tr onclick="location.href='${pageContext.request.contextPath}/user/inquiry/read?inquiryId=${inq.inquiryId}'" style="cursor:pointer;">
            <td>${inq.inquiryId}</td>
            <td>${inq.inquiryName}</td>
            <td>${inq.inquiryType}</td>
            <td>${inq.userName}</td>
            <td>
                <c:choose>
                    <c:when test="${inq.inquiryStatus eq '처리완료'}">
                        <span style="color:green;">${inq.inquiryStatus}</span>
                    </c:when>
                    <c:otherwise>
                        <span style="color:orange;">${inq.inquiryStatus}</span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${inq.createdAt}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
