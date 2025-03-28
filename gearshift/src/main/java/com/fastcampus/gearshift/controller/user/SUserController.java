package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.mail.SEmailAuthService;
import com.fastcampus.gearshift.service.SUserService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SUserController {

    @Autowired
    private SUserService userService;

    @Autowired
    private SEmailAuthService emailAuthService;


    @GetMapping("/register")
    public String loadRegisterPage(Model model) {
        return "user/register";
    }

    @PostMapping("/register")
    public String processRegister(@ModelAttribute UserDto user, Model model) {
        userService.registerUser(user);
<<<<<<< Updated upstream
        return "redirect:/login.do";
    }

    @GetMapping("/login.do")
    public String loadLoginPage(@RequestParam(required = false) String error,
                                @RequestParam(required = false) String loginType,
                                Model model) {
        model.addAttribute("error", error);
        model.addAttribute("loginType", loginType);
        return "user/login";
    }

=======
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loadLoginPage(Model model) {
        return "user/login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String userEmail,
                               @RequestParam String userPassword,
                               HttpSession session,
                               Model model) {
        UserDto user = userService.findUserByEmail(userEmail);

        if (user == null || !user.getUserPassword().equals(userPassword)) {
            model.addAttribute("error", "이메일 또는 비밀번호가 틀렸습니다.");
            return "user/login";
        }

        session.setAttribute("loginUser", user); // 세션에 사용자 저장
        // 로그인 전 요청한 URL로 리다이렉트
        String redirectUrl = (String) session.getAttribute("redirectAfterLogin");

        //디버깅 테스트
        System.out.println("redirectAfterLogin = " + redirectUrl);

        if (redirectUrl != null) {
            session.removeAttribute("redirectAfterLogin"); // 사용 후 제거
            return "redirect:" + redirectUrl;
        }

        return "redirect:/"; // 없으면 기본으로
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 비우기
        return "redirect:/";
    }

>>>>>>> Stashed changes
    @PostMapping("/check-email")
    @ResponseBody
    public Map<String, Boolean> checkEmail(@RequestBody Map<String, String> body) {
        String userEmail = body.get("email");
        UserDto user = userService.findUserByEmail(userEmail);

        Map<String, Boolean> result = new HashMap<>();
        boolean isDuplicate = (user == null) ? false : true;
        result.put("duplicate", isDuplicate);

        return result;
    }

    @PostMapping("/send-auth-email")
    @ResponseBody
    public Map<String, Boolean> sendEmail(@RequestBody Map<String, String> body) {
        String email = body.get("email");
        boolean success = emailAuthService.sendCode(email);
        return Map.of("success", success);
    }

    @PostMapping("/verify-email-code")
    @ResponseBody
    public Map<String, Boolean> verifyCode(@RequestBody Map<String, String> body) {
        String email = body.get("email");
        String code = body.get("code");
        boolean result = emailAuthService.verifyCode(email, code);
        return Map.of("verified", result);
    }

<<<<<<< Updated upstream
    @GetMapping("/error403")
    public String handle403() {
        return "error/403";
    }

    @GetMapping("/error404")
    public String handle404() {
        return "error/404";
    }

=======
>>>>>>> Stashed changes
}
