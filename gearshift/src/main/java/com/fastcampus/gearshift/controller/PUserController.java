package com.fastcampus.gearshift.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PUserController {
    @GetMapping("/index")
    public String index(){
        return "user/userIndex";

    }
    @GetMapping("/list")
    public String list(){
        return "user/userList";
    }
}
