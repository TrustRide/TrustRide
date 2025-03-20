<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/register.css">
</head>
<body>
    <h2>회원가입</h2>

    <div class="container">
        <div class="input-group">
            <label for="id">아이디 *</label>
            <input type="text" id="id" placeholder="아이디 입력">
        </div>

        <div class="input-group">
            <label for="password">비밀번호 *</label>
            <input type="password" id="password" placeholder="비밀번호 입력">
        </div>

        <div class="input-group">
            <label for="name">이름 *</label>
            <input type="text" id="name" placeholder="이름 입력">
        </div>

        <div class="input-group">
            <label for="email">이메일 *</label>
            <input type="email" id="email" placeholder="이메일 입력">
        </div>

        <button class="signup-btn">가입하기</button>
    </div>

    <script>
        const inputs = document.querySelectorAll(".input-group input");
        const signupBtn = document.querySelector(".signup-btn");

        function checkInputs() {
            // 모든 입력 필드가 채워졌는지 확인
            const allFilled = Array.from(inputs).every(input => input.value.trim() !== "");

            if (allFilled) {
                signupBtn.classList.add("active"); // 빨간색으로 변경
                signupBtn.removeAttribute("disabled"); // 버튼 활성화
            } else {
                signupBtn.classList.remove("active"); // 회색으로 변경
                signupBtn.setAttribute("disabled", "true"); // 버튼 비활성화
            }
        }

        // 모든 입력 필드에 이벤트 리스너 추가
        inputs.forEach(input => {
            input.addEventListener("input", checkInputs);
        });
    </script>
</body>
</html>
