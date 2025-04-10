package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.CarDetailDto;
import com.fastcampus.gearshift.dto.CarInfoDto;
import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.LUserCarInfoService;
import com.fastcampus.gearshift.service.NUserFormService;
import com.fastcampus.gearshift.service.PHolderService;
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

    @Autowired
    private PHolderService pHolderService;


    // 결제수단 선택페이지 이동
    @PostMapping("/select")
    public String selectPayment(CarDetailDto carDetailDto, Model model) throws Exception{

        // carInfoId로 다시 조회해서 carInfo 채움
        CarInfoDto carInfo = pHolderService.carSelect(carDetailDto.getCarInfoId());

        // 자동차 정보 데이터
        model.addAttribute("carInfo", carInfo);

        // 자동차 정보 이외에 넘겨야 할 데이터
        model.addAttribute("carDetailDto", carDetailDto);

        return "user/userChoosePayment";
    }


    // 결제 상세 페이지 이동
    @PostMapping("/detail")
    public String getPaymentDetail(CarDetailDto carDetailDto, Model model) throws Exception{

        // carInfoId로 다시 조회해서 carInfo 채움
        CarInfoDto carInfo = pHolderService.carSelect(carDetailDto.getCarInfoId());

        // 자동차 정보 데이터
        model.addAttribute("carInfo", carInfo);

        // 자동차 정보 이외에 넘겨야 할 데이터
        model.addAttribute("carDetailDto", carDetailDto);

        return "user/userPaymentDetail";
    }

    // 카드 결제 페이지 이동
    @PostMapping("/creditCard")
    public String goToPayment(CarDetailDto carDetailDto, Model model, HttpSession session) throws  Exception {

        // 세션에 저장된 userId 가져오기
        UserDto userDto =  (UserDto)session.getAttribute("loginUser");
        Integer userId = userDto.getUserId();

        UserDto userInfoDto = userService.getUserFormById(userId);

        CarInfoDto carInfo = pHolderService.carSelect(carDetailDto.getCarInfoId());
        // userId 세팅


        // 자동차 정보 데이터
        model.addAttribute("carInfo", carInfo);

        // 자동차 정보 이외에 넘겨야 할 데이터
        model.addAttribute("carDetailDto", carDetailDto);

        // 유저 정보
        model.addAttribute("userInfo", userInfoDto);

        return "user/userPayment";
    }

}
