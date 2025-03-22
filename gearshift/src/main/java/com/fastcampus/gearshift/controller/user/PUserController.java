package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.CategoryDto;

import com.fastcampus.gearshift.dto.UserDto;

import com.fastcampus.gearshift.service.PCateService;
import com.fastcampus.gearshift.service.PHolderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/")
    public String index(){
        return "user/userIndex";
    }

    @GetMapping("/login2")
    public String login2(){
        return "user/loginForm";
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
