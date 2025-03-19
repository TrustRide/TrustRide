package com.fastcampus.gearshift.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/qna")
public class SAdminQnaController {

    @GetMapping("/list")
    public String loadAdminPage(Model model) {
        return "admin/qna";
    }

}