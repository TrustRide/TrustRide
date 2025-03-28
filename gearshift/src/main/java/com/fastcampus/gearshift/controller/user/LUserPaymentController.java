package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.CarDetailDto;
import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.LUserCarInfoService;
import com.fastcampus.gearshift.service.NUserFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/payment")
public class LUserPaymentController {

    @Autowired
    private LUserCarInfoService userCarInfoService;
    @Autowired
    private NUserFormService userService;


    @PostMapping("/select")
    public String selectPayment(@ModelAttribute CarDetailDto dto, Model model) {

        // carInfoId로 다시 조회해서 carInfo 채움
        CarDetailDto carInfo = userCarInfoService.getCarInfo(dto.getCarInfoId());

        // 자동차 정보 데이터
        model.addAttribute("carInfo", carInfo);

        // 자동차 정보 이외에 넘겨야 할 데이터
        model.addAttribute("carInfoDto", dto);

        return "user/userChoosePayment";
    }


    // 결제 상세 페이지 이동
    @PostMapping("/detail")
    public String getPaymentDetail(@ModelAttribute CarDetailDto dto, Model model) {

        // carInfoId로 다시 조회해서 carInfo 채움
        CarDetailDto carInfo = userCarInfoService.getCarInfo(dto.getCarInfoId());

        // 자동차 정보 데이터
        model.addAttribute("carInfo", carInfo);

        // 자동차 정보 이외에 넘겨야 할 데이터
        model.addAttribute("carInfoDto", dto);

        return "user/userPaymentDetail";
    }

    // 카드 결제 페이지 이동
    @PostMapping("/creditCard")
    public String goToPayment(@ModelAttribute CarDetailDto dto, Model model, HttpSession session) {

        // 세션에 저장된 userId 가져오기
        UserDto userDto =  (UserDto)session.getAttribute("loginUser");
        Integer userId = userDto.getUserId();

        UserDto userInfoDto = userService.getUserFormById(userId);


        // carInfoId로 다시 조회해서 carInfo 채움
        CarDetailDto carInfo = userCarInfoService.getCarInfo(dto.getCarInfoId());

        // userId 세팅


        // 자동차 정보 데이터
        model.addAttribute("carInfo", carInfo);

        // 자동차 정보 이외에 넘겨야 할 데이터
        model.addAttribute("carInfoDto", dto);

        // 유저 정보
        model.addAttribute("userInfo", userInfoDto);

        return "user/userPayment";
    }

}
