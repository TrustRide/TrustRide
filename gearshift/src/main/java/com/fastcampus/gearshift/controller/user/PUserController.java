package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.*;

import com.fastcampus.gearshift.service.JWishlistService;
import com.fastcampus.gearshift.service.PCateService;
import com.fastcampus.gearshift.service.PHolderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    JWishlistService wishlistService;

    @Autowired
    PHolderService pHolderService;


    @GetMapping("/")
    public String index(){
        return "user/userIndex";
    }





    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String getList(@RequestParam(defaultValue = "1") int page,
                          @RequestParam(required = false) String cateCode,
                          Model model, HttpSession session) throws Exception {
        int pageSize = 9; // 한 페이지에 표시할 상품 개수

        // 전체 상품 개수 조회
        int totalCount = (cateCode == null) ? pHolderService.getCarCount() : pHolderService.getCarCountByCate(cateCode);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize); // 총 페이지 수 계산


        List<CarListDto> userCarList;
        if (cateCode == null) {
            userCarList = pHolderService.carselect(page, pageSize);
        } else {
            userCarList = pHolderService.carselectByCate(cateCode, page, pageSize);
        }


        // ★ 로그인 유저
        UserDto user = (UserDto) session.getAttribute("loginUser");
        Integer userId = (user != null) ? user.getUserId() : null;
        
        // isLogin 으로 로그인안되어있을 때 안보이도록
        boolean isLogin = userId != null;

        if(userId != null) {
            // 각 차량에 대해 isWished 설정
            for (CarListDto car : userCarList) {
                boolean wished = wishlistService.isWished(userId, car.getCarInfoId());
                car.setIsWished(wished);
            }
        }
        model.addAttribute("userCarList", userCarList);

        // 카테고리 목록 가져오기
        List<CategoryDto> cateList = cateService.cateList();
        if (cateList == null || cateList.isEmpty()) {
            throw new RuntimeException("cateList 데이터가 비어있습니다!");
        }

        // 모델에 데이터 추가
        model.addAttribute("cateList", cateList);
        model.addAttribute("userCarList", userCarList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("isLogin", isLogin);

        return "user/userCarList";
    }



    @GetMapping("/user/delivery")
    public String getDelivery(
            @RequestParam("carInfoId") Integer carInfoId,
            @RequestParam("title") String title,
            @RequestParam("isJointHolder") Boolean isJointHolder,
            HttpSession session,
            Model model
    ) throws Exception {

        UserDto userDto = (UserDto) session.getAttribute("loginUser");
        if (userDto == null) {
            return "redirect:/login.do";
        }

        Integer userId = userDto.getUserId();
        UserDto selectedUser = pHolderService.userSelect(userId);
        CarInfoDto carInfoDto = pHolderService.carSelect(carInfoId);

        // 👉 여기서 DTO에 값 주입
        carInfoDto.setOwnershipType(title);
        carInfoDto.getOwnershipType();


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
    public String getDetail(@RequestParam("carInfoId") Integer carInfoId, Model model,CarInfoDto dto) throws Exception {
        CarInfoDto carInfoDto = pHolderService.carSelect(carInfoId);

        logger.debug("요청된 carInfoId = {}", carInfoId);
        logger.debug("조회된 carInfoDto = {}", carInfoDto);

        model.addAttribute("carDto", carInfoDto);
        model.addAttribute("dto", dto);

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