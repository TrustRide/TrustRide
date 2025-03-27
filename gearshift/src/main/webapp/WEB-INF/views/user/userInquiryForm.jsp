<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>문의 작성/수정</title>
</head>
<body>
<h2><c:choose><c:when test="${mode eq 'new'}">문의 작성</c:when><c:otherwise>문의 상세</c:otherwise></c:choose></h2>
<c:if test="${mode eq 'view'}">
  <p><strong>문의 상태:</strong>
    <c:choose>
      <c:when test="${inquiry.inquiryStatus eq '처리완료'}">
        <span style="color:green; font-weight:bold;">${inquiry.inquiryStatus}</span>
      </c:when>
      <c:otherwise>
        <span style="color:orange; font-weight:bold;">${inquiry.inquiryStatus}</span>
      </c:otherwise>
    </c:choose>
  </p>
</c:if>
<c:choose>
  <c:when test="${inquiry.inquiryStatus eq '처리완료'}">
    ✅ <span style="color:green;">${inquiry.inquiryStatus}</span>
  </c:when>
  <c:otherwise>
    ⏳ <span style="color:orange;">${inquiry.inquiryStatus}</span>
  </c:otherwise>
</c:choose>


<form method="post" action="${mode eq 'new' ? '/user/inquiry/write' : '/user/inquiry/modify'}">
  <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}" />
  <label>제목</label><br/>
  <input type="text" name="inquiryName" value="${inquiry.inquiryName}" required/><br/>
  <label>문의내용</label><br/>
  <textarea name="inquiryContent" rows="5" required>${inquiry.inquiryContent}</textarea><br/>
  <label>문의유형</label><br/>
  <select name="inquiryType">
    <option value="상품문의">상품문의</option>
    <option value="주문문의">주문문의</option>
    <option value="배송문의">배송문의</option>
    <option value="환불문의">환불문의</option>
    <option value="기타">기타</option>
  </select><br/><br/>
  <button type="submit">저장</button>
</form>

<c:if test="${mode eq 'view'}">
  <form method="post" action="/user/inquiry/delete">
    <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}" />
    <button type="submit">삭제</button>
  </form>
  <h3>관리자 답변</h3>
  <c:forEach var="comment" items="${commentList}">
    <div style="border:1px solid #ccc; padding:10px; margin-bottom:5px">
      <p>${comment.commentContent}</p>
      <small>${comment.createdAt}</small>
    </div>
  </c:forEach>
</c:if>
</body>
</html>