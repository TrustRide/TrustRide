package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.SUserService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class SUserController {

    @Autowired
    private SUserService userService;

    @GetMapping("/register")
    public String loadRegisterPage(Model model) {
        return "user/register";
    }

    @PostMapping("/register")
    public String processRegister(@ModelAttribute UserDto user, Model model) {
        if (userService.isEmailDuplicated(user.getUserEmail())) {
            model.addAttribute("error", "이미 존재하는 이메일입니다.");
            return "user/register";
        }

        userService.registerUser(user);
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
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 비우기
        return "redirect:/";
    }

}
