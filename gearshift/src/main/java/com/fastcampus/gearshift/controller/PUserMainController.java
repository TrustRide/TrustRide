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

    @GetMapping("/list3")
    public String list3(){
        return "list3";
    }
    @GetMapping("/list4")
    public String list4(){
        return "list4";
    }
}
