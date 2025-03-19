package com.fastcampus.gearshift.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SUserController {

    @GetMapping("/register")
    public String loadRegisterPage(Model model) {
        return "user/register";
    }

    @GetMapping("/login")
    public String loadLoginPage(Model model) {
        return "user/login";
    }

}
