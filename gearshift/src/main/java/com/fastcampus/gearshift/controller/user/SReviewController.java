package com.fastcampus.gearshift.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SReviewController {

    @GetMapping("/review")
    public String loadReviewPage(Model model) {
        return "user/review";
    }

}
