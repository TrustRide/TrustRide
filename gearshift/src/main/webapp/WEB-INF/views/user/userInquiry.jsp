<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 목록</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f3f5;
            margin: 0;
            padding: 40px 20px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.08);
        }

        h2 {
            color: #212529;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            color: white;
            background-color: #0d6efd;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0b5ed7;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 12px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #0d6efd;
            color: #fff;
        }

        tr {
            transition: background-color 0.2s ease;
        }

        tr:hover {
            background-color: #f8f9fa;
            cursor: pointer;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            display: inline-block;
            font-size: 13px;
        }

        .completed {
            background-color: #198754;
            color: #fff;
        }

        .pending {
            background-color: #ffc107;
            color: #212529;
        }

        .empty-message {
            padding: 50px 0;
            color: #868e96;
            font-size: 16px;
            text-align: center;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            tr {
                margin-bottom: 15px;
                background: #f8f9fa;
                border-radius: 10px;
                padding: 10px;
            }

            td {
                text-align: left;
                padding: 8px;
                position: relative;
            }

            td::before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                margin-bottom: 4px;
                color: #495057;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📋 문의 목록</h2>
    <a href="${pageContext.request.contextPath}/user/inquiry/write" class="btn">＋ 새 문의 작성</a>

    <c:choose>
        <c:when test="${empty inquiryList}">
            <div class="empty-message">😢 등록된 문의가 없습니다. <br>문의하고 싶은 내용을 작성해 주세요!</div>
        </c:when>
        <c:otherwise>
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
                        <td data-label="번호">${inq.inquiryId}</td>
                        <td data-label="제목">${inq.inquiryName}</td>
                        <td data-label="문의유형">${inq.inquiryType}</td>
                        <td data-label="작성자">${inq.userName}</td>
                        <td data-label="상태">
                            <c:choose>
                                <c:when test="${inq.inquiryStatus eq '처리완료'}">
                                    <span class="status completed">✔ 처리완료</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status pending">⏳ 처리중</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td data-label="작성일">${inq.createdAt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
