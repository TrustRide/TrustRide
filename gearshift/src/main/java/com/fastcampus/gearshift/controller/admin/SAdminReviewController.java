package com.fastcampus.gearshift.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class SAdminReviewController {

    @GetMapping("/review")
    public String loadReviewPage(Model model) {
        return "admin/review";
    }

}