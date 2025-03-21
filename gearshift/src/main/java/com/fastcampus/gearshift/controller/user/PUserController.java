package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.CategoryDto;
import com.fastcampus.gearshift.service.PCateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
public class PUserController {
    private static final Logger logger = LoggerFactory.getLogger(PUserController.class);
    @Autowired
    PCateService cateService;
    @GetMapping("/")
    public String index(){
        return "user/userIndex";
    }

    @GetMapping("/login2")
    public String login2(){
        return "user/loginForm";
    }
  
    @GetMapping("/loginTest")
    public String login(){
        return "user/loginForm";
    }


    //로그인 테스트
    @PostMapping("/loginTest")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model, String id, String pwd){

        if(id.equals("user11@example.com")&&pwd.equals("pwd11")) {
            model.addAttribute("id", id);
            model.addAttribute("pwd", pwd);

            request.getSession().setAttribute("userId", id);
            return "redirect:/";
        }
        return "redirect:/";

    }

    //로그아웃 테스트
    @GetMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session =request.getSession();
        session.invalidate();
        return "redirect:/";
    }


    //카테고리
    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String getList(Model model) throws Exception {
        List<CategoryDto> list = cateService.cateList();

        if (list == null || list.isEmpty()) {
            throw new RuntimeException("cateList 데이터가 비어있습니다!");
        }

        model.addAttribute("cateList", list);
        return "user/userCarList";
    }

}
