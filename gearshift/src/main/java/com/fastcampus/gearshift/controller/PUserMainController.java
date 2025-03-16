package com.fastcampus.gearshift.controller;

<<<<<<< Updated upstream
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PUserMainController {
    @GetMapping("/main")
    public String main(){
        return "main";
=======





public class PUserMainController {
    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
>>>>>>> Stashed changes
    }
}
