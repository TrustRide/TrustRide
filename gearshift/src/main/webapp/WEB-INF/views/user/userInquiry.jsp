<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 목록</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        .container {
            width: 80%;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }
        .status {
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }
        .completed {
            background-color: #28a745;
            color: white;
        }
        .pending {
            background-color: #ffc107;
            color: black;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>문의 목록</h2>
    <a href="${pageContext.request.contextPath}/user/inquiry/write" class="btn">새 문의 작성</a>
    <table>
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
            <tr onclick="location.href='${pageContext.request.contextPath}/user/inquiry/read/${inq.inquiryId}'">
                <td>${inq.inquiryId}</td>
                <td>${inq.inquiryName}</td>
                <td>${inq.inquiryType}</td>
                <td>${inq.userName}</td>
                <td>
                    <c:choose>
                        <c:when test="${inq.inquiryStatus eq '처리완료'}">
                            <span class="status completed">✔ 처리완료</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status pending">⏳ 처리중</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${inq.createdAt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
