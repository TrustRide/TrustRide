<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>나의 문의 목록</title>
</head>
<body>
<h2>내 문의 목록</h2>
<a href="/user/inquiry/write">새 문의 작성</a>
<table border="1">
    <thead>
    <tr>
        <th>상태</th>
        <th>제목</th>
        <th>작성일시</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="inquiry" items="${inquiryList}">
        <tr onclick="location.href='inquiry/read?inquiryId=${inquiry.inquiryId}'">
            <td>
                <c:choose>
                    <c:when test="${inquiry.inquiryStatus eq '처리완료'}">
                        <span style="color:green; font-weight:bold;">${inquiry.inquiryStatus}</span>
                    </c:when>
                    <c:otherwise>
                        <span style="color:orange; font-weight:bold;">${inquiry.inquiryStatus}</span>
                    </c:otherwise>
                </c:choose>
            </td>

            <td>${inquiry.inquiryName}</td>
            <td>${inquiry.createdAt}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>