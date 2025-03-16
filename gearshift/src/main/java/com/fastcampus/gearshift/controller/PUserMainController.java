package com.fastcampus.gearshift.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PUserMainController {
    @GetMapping("/main")
    public String main(){
        return "main";
    }

    @GetMapping("/list")
    public String list(){
        return "list";
    }

    @GetMapping("/list2")
    public String list2(){
        return "list2";
    }
}
