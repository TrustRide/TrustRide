package com.fastcampus.gearshift.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

public class BAdminController {



    @GetMapping("/admin/{page}")
    public String loadAdminPage(@PathVariable("page") String page, Model model) {
        // 유효한 JSP 파일인지 확인 후 반환
        return "admin/" + page;
    }
}

