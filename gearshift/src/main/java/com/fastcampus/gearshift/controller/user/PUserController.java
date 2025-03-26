package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.*;

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



    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String getList(@RequestParam(defaultValue = "1") int page, Model model) throws Exception {
        int pageSize = 9; // 한 페이지에 표시할 상품 개수
        int totalCount = pHolderService.getCarCount(); // 전체 상품 개수 조회
        int totalPages = (int) Math.ceil((double) totalCount / pageSize); // 총 페이지 수 계산

        // 카테고리 목록 가져오기
        List<CategoryDto> cateList = cateService.cateList();
        if (cateList == null || cateList.isEmpty()) {
            throw new RuntimeException("cateList 데이터가 비어있습니다!");
        }

        // 페이징된 차량 목록 조회
        List<CarListDto> userCarList = pHolderService.carselect(page, pageSize);

        // 모델에 데이터 추가
        model.addAttribute("cateList", cateList);
        model.addAttribute("userCarList", userCarList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "user/userCarList";
    }



    @GetMapping("/delivery")
    public String getDelivery(
            @RequestParam("carInfoId") Integer carInfoId,
            HttpSession session,
            Model model
    ) throws Exception {

        UserDto userDto = (UserDto) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 꺼내기
        if (userDto == null) {
            return "redirect:/login";
        }

        Integer userId = userDto.getUserId(); // userId 추출

        UserDto selectedUser = pHolderService.userSelect(userId);
        CarInfoDto carInfoDto = pHolderService.carSelect(carInfoId);

        model.addAttribute("userDto", selectedUser);
        model.addAttribute("carDto", carInfoDto);

        return "user/deliveryInformation";
    }


    @PostMapping("/deliveryInsert")
    public String postDelivery(UserDto userDto) throws  Exception{

        //나중에 유효성 검사 및 경로 수정
        return "user/userCarList";
    }


    @GetMapping("/carDetail")
    public String getDetail(@RequestParam("carInfoId") Integer carInfoId, Model model) throws Exception {
        CarInfoDto carInfoDto = pHolderService.carSelect(carInfoId);

        logger.debug("요청된 carInfoId = {}", carInfoId);
        logger.debug("조회된 carInfoDto = {}", carInfoDto);

        model.addAttribute("carDto", carInfoDto);
        return "user/userCarDetail";
    }



    //차량 명의
    @GetMapping("/titleHolder")
    public String getHolder(
            @RequestParam("carInfoId") Integer carInfoId,
            Model model,
            HttpSession session
    ) throws Exception {
        // 여기를 "loginUser"로 변경해야 세션에서 제대로 꺼낼 수 있음




        CarInfoDto carInfoDto = pHolderService.carSelect(carInfoId);

        model.addAttribute("carDto", carInfoDto);


        return "user/userTitleHolder";
    }



    //메인화면 + 상품리스트 검색
    @GetMapping("/searchCar")
    public String searchCar(@RequestParam("searchQuery") String searchQuery,Model model) throws Exception{
        //페이지 크기 설정(예:10)

        List<CarListDto> searchResults = pHolderService.searchCarsByTitle(searchQuery);
        model.addAttribute("userCarList",searchResults);
        return "user/userCarList";
    }



}
