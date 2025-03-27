<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>문의 관리</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/inquiry.css">
</head>
<body>
<main class="content">
  <h2>문의관리</h2>
  <h2>고객 문의 목록</h2>

  <table class="inquiry-table">
    <thead>
    <tr>
      <th>처리상태</th>
      <th>문의유형</th>
      <th>문의제목</th>
      <th>상품번호</th>
      <th>상품명</th>
      <th>회원이름</th>
      <th>이메일</th>
      <th>작성일시</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="inquiry" items="${inquiryList}">
      <tr onclick="location.href='${pageContext.request.contextPath}/admin/inquiry/read?inquiryId=${inquiry.inquiryId}'"
          style="cursor:pointer;">
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

        <td>${inquiry.inquiryType}</td>
        <td>${inquiry.inquiryName}</td>
        <td>${inquiry.carInfoId}</td>
        <td>${inquiry.modelName}</td>
        <td>${inquiry.userName}</td>
        <td>${inquiry.userEmail}</td>
        <td>${inquiry.createdAt}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</main>
</body>
</html>
