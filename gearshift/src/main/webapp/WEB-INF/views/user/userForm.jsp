<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>개인정보확인/수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
        }
        form {
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #ccc;
            width: 350px;
        }
        label {
            display: inline-block;
            width: 140px;
            margin-bottom: 8px;
        }
        input {
            width: 180px;
            padding: 5px;
        }
        button {
            margin-top: 10px;
            padding: 6px 14px;
        }
        #profileForm, #deleteForm, #newPasswordRow {
            display: none;
        }
    </style>
    <script>
        function checkPassword() {
            const password = document.getElementById("checkPassword").value;
            fetch("${pageContext.request.contextPath}/user/userForm/check-password", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify({password: password})
            })
                .then(res => res.json())
                .then(data => {
                    if (data.verified) {
                        alert("비밀번호 확인 완료");
                        document.getElementById("passwordCheckArea").style.display = "none";
                        document.getElementById("profileForm").style.display = "block";
                        document.getElementById("deleteForm").style.display = "block";
                        document.getElementById("newPasswordRow").style.display = "block";
                        document.getElementById("currentPassword").value = password;
                        document.getElementById("currentPasswordDel").value = password;
                    } else {
                        alert("비밀번호가 일치하지 않습니다.");
                    }
                });
        }
    </script>
</head>
<body>

<h2>회원 프로필</h2>

<!-- 비밀번호 확인 영역 -->
<div id="passwordCheckArea">
    <label>비밀번호:</label>
    <input type="password" id="checkPassword" />
    <button onclick="checkPassword()">확인</button>
</div>

<!-- 정보 수정 폼 -->
<form id="profileForm" action="${pageContext.request.contextPath}/user/userForm/update" method="post">
    <input type="hidden" name="userId" value="${user.userId}" />
    <input type="hidden" name="currentPassword" id="currentPassword" />

    <label>고객명:</label>
    <input type="text" name="userName" value="${user.userName}" readonly /><br/>

    <label>이메일:</label>
    <input type="email" name="userEmail" value="${user.userEmail}" /><br/>

    <label>연락처:</label>
    <input type="text" name="userPhoneNumber" value="${user.userPhoneNumber}" /><br/>

    <div id="newPasswordRow">
        <label>새 비밀번호:</label>
        <input type="password" name="userPassword" /><br/>
    </div>

    <button type="submit">변경하기</button>
</form>

<!-- 탈퇴 폼 -->
<form id="deleteForm" action="${pageContext.request.contextPath}/user/userForm/delete" method="post"
      onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
    <input type="hidden" name="currentPassword" id="currentPasswordDel" />
    <button type="submit" style="background-color:#f44336; color:white;">탈퇴하기</button>
</form>

</body>
</html>
