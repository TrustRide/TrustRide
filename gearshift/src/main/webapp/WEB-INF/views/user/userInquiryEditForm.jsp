<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 수정</title>
</head>
<body>
<h2>문의 수정</h2>

<form method="post" action="${pageContext.request.contextPath}/user/inquiry/modify">
    <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}" />

    <label>제목</label><br/>
    <input type="text" name="inquiryName" value="${inquiry.inquiryName}" required/><br/>

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

    <label>모델명</label><br/>
    <input type="text" name="modelName" value="${inquiry.modelName}" /><br/>

    <label>차량 ID</label><br/>
    <input type="number" name="carInfoId" value="${inquiry.carInfoId}" /><br/><br/>

    <button type="submit">수정 완료</button>
</form>
</body>
</html>
