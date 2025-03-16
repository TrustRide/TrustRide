package com.fastcampus.gearshift.controller;


    


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PUserMainController {
    @GetMapping("/main")
    public String main() {
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

    @GetMapping("/list5")
    public String list5(){
        return "list5";
    }
    @GetMapping("/list6")
    public String list6(){
        return "list6";
    }

    @GetMapping("/list7")
    public String list7(){
        return "list7";
    }

    @GetMapping("/list8")
    public String list8(){
        return "list8";
    }



}
