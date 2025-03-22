package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.CategoryDto;

import com.fastcampus.gearshift.dto.UserDto;

import com.fastcampus.gearshift.service.PCateService;
import com.fastcampus.gearshift.service.PHolderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    PHolderService pHolderService;
    @GetMapping("/main")
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

    //차량 명의
    @GetMapping("/titleHolder")
    public String getHolder(){
        return "user/userTitleHolder";
    }

    @GetMapping("/delivery")
    public String getDelivery(@RequestParam(value = "userId", defaultValue = "1")Integer userId,Model model)throws Exception{
        UserDto userDto = pHolderService.read(userId);
        model.addAttribute("userDto",userDto);

        return "user/deliveryInformation";
    }

    @PostMapping("/deliveryInsert")
    public String postDelivery(UserDto userDto) throws  Exception{
        pHolderService.modify(userDto);
        //나중에 유효성 검사 및 경로 수정
        return "user/userCarList";


    }

}
