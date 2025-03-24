package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.CarDto;
import com.fastcampus.gearshift.dto.CategoryDto;

import com.fastcampus.gearshift.dto.HolderDTO;
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
        List<CarDto> userCarList =pHolderService.carselect();

        model.addAttribute("cateList", list);
        model.addAttribute("userCarList",userCarList);
        return "user/userCarList";
    }


    @GetMapping("/delivery")
    public String getDelivery(@RequestParam("carInfoId") Integer carInfoId, HttpSession session, Model model) throws Exception {

        // ⭐ 테스트용 userId 강제 주입 (나중에 로그인 구현되면 삭제)
        if (session.getAttribute("userId") == null) {
            session.setAttribute("userId", 2); // userId=1번 계정으로 임시 테스트
        }

         Integer userId = (Integer) session.getAttribute("userId");

        // userId로 유저 정보 조회
        UserDto userDto = pHolderService.userSelect(userId);
        CarDto carDto = pHolderService.carSelect(carInfoId);

        model.addAttribute("userDto", userDto);
        model.addAttribute("carDto", carDto);

        return "user/deliveryInformation";
    }

    @PostMapping("/deliveryInsert")
    public String postDelivery(UserDto userDto) throws  Exception{
        pHolderService.modify(userDto);
        //나중에 유효성 검사 및 경로 수정
        return "user/userCarList";
    }


    @GetMapping("/carDetail")
    public String getDetail(@RequestParam("carInfoId") Integer carInfoId, Model model) throws Exception {
        CarDto carDto = pHolderService.carSelect(carInfoId);
        System.out.println(" 요청된 carInfoId = " + carInfoId);
        System.out.println(" 조회된 carDto = " + carDto);
        model.addAttribute("carDto", carDto);
        return "user/userCarDetail";
    }

    //차량 명의
    @GetMapping("/titleHolder")
    public String getHolder(@RequestParam("carInfoId")Integer carInfoID,Model model,HttpSession session)throws Exception{
        CarDto carDto = pHolderService.carSelect(carInfoID);
        model.addAttribute("carDto",carDto);

        return "user/userTitleHolder";
    }





}
