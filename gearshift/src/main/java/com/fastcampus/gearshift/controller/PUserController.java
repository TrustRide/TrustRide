package com.fastcampus.gearshift.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class PUserController {
    @GetMapping("/main")
    public String index(){
        return "user/userIndex";
    }

    @GetMapping("/login")
    public String login(){
        return "user/loginForm";
    }


    //로그인 테스트
    @PostMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model, String id, String pwd){

        if(id.equals("user11@example.com")&&pwd.equals("pwd11")) {
            model.addAttribute("id", id);
            model.addAttribute("pwd", pwd);

            request.getSession().setAttribute("userId", id);
            return "redirect:/main";
        }
        return "redirect:/main";

    }

    //로그아웃 테스트
    @GetMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session =request.getSession();
        session.invalidate();
        return "redirect:/main";
    }





}
