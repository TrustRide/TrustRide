<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>문의 작성/조회</title>
</head>
<body>
<h2>${inquiry.inquiryId == null ? '문의 작성' : '문의 상세'}</h2>

<form method="post" action="${pageContext.request.contextPath}/user/inquiry/write">
  <c:if test="${inquiry.inquiryId != null}">
    <p><strong>문의 ID:</strong> ${inquiry.inquiryId}</p>
  </c:if>

  <label>제목</label><br/>
  <input type="text" name="inquiryName" value="${inquiry.inquiryName}" required/><br/>

  <label>모델명</label><br/>
  <input type="text" name="inquiryName" value="${inquiry.modelName}" required/><br/>

  <label>문의 내용</label><br/>
  <textarea name="inquiryContent" rows="5" required>${inquiry.inquiryContent}</textarea><br/>

  <label>문의 유형</label><br/>
  <select name="inquiryType">
    <option value="상품문의" ${inquiry.inquiryType eq '상품문의' ? 'selected' : ''}>상품문의</option>
    <option value="주문문의" ${inquiry.inquiryType eq '주문문의' ? 'selected' : ''}>주문문의</option>
    <option value="배송문의" ${inquiry.inquiryType eq '배송문의' ? 'selected' : ''}>배송문의</option>
    <option value="환불문의" ${inquiry.inquiryType eq '환불문의' ? 'selected' : ''}>환불문의</option>
    <option value="기타" ${inquiry.inquiryType eq '기타' ? 'selected' : ''}>기타</option>
  </select><br/><br/>


  <c:if test="${inquiry.inquiryId != null}">
    <form method="get" action="${pageContext.request.contextPath}/user/inquiry/modify">
      <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}" />
      <button type="submit">수정하기</button>
    </form>

  </c:if>
  <c:if test="${inquiry.inquiryId == null}">
    <button type="submit">등록</button>
  </c:if>
</form>

<c:if test="${inquiry.inquiryId != null}">
  <p><strong>상태:</strong> ${inquiry.inquiryStatus}</p>
  <p><strong>작성일:</strong> ${inquiry.createdAt}</p>
  <p><strong>수정일:</strong> ${inquiry.updatedAt}</p>
</c:if>

</body>
</html>
