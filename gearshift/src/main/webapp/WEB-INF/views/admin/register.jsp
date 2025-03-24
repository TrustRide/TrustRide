<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/register.css">
</head>
<body>

    <!-- 헤더 포함 -->
    <jsp:include page="include/header.jsp"/>

    <!-- 사이드바 포함 -->
    <jsp:include page="include/sidebar.jsp"/>

    <!-- 본문 컨텐츠 -->
    <main class="content">
        <form action="${pageContext.request.contextPath}/admin/register" method="post">
            <h2>관리자 회원가입</h2>

            <div class="form-group">
                <label for="adminEmail">이메일</label>
                <div class="email-check">
                    <input type="email" id="adminEmail" name="adminEmail" required />
                    <button type="button">중복확인</button>
                </div>
            </div>

            <label for="adminPassword">비밀번호</label>
            <input type="password" id="adminPassword" name="adminPassword" required>

            <label for="passwordConfirm">비밀번호 확인</label>
            <input type="password" id="passwordConfirm" name="passwordConfirm" required>

            <label for="adminPhone">전화번호</label>
            <input type="tel" id="adminPhone" name="adminPhone" required>

            <label for="adminName">이름</label>
            <input type="text" id="adminName" name="adminName" required>

            <label for="department">부서</label>
            <select id="department" name="department" required>
                <option value="">선택하세요</option>
                <option value="개발부">개발부</option>
                <option value="인사부">인사부</option>
                <option value="마케팅부">마케팅부</option>
                <option value="회계부">회계부</option>
            </select>

            <label for="position">직급</label>
            <select id="position" name="position" required>
                <option value="">선택하세요</option>
                <option value="사원">사원</option>
                <option value="주임">주임</option>
                <option value="대리">대리</option>
                <option value="과장">과장</option>
                <option value="차장">차장</option>
                <option value="부장">부장</option>
            </select>

            <label>성별:</label>
            <div class="gender-group">
                <label><input type="radio" name="gender" value="M" required> 남</label>
                <label><input type="radio" name="gender" value="F" required> 여</label>
            </div>

            <button type="submit">가입하기</button>
        </form>
    </main>

</body>
</html>