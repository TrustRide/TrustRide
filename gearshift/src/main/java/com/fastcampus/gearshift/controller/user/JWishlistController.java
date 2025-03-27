package com.fastcampus.gearshift.controller.user;


import com.fastcampus.gearshift.dto.CarListDto;
import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.JWishlistService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/wishlist")
public class JWishlistController {

    private final JWishlistService wishlistService;

    // [A] 찜 등록
    @PostMapping("/add")
    public String addWishlist(@RequestParam("carInfoId") Integer carInfoId,
                              HttpSession session) {
        
        UserDto user = (UserDto) session.getAttribute("loginUser");
        System.out.println("user 컨트롤러 = " + user);
        
//        if (user == null) {
//            return "redirect:/login";
//        }
        wishlistService.addWishlist(user.getUserId(), carInfoId);
        // 등록 후 어디로 이동할지(차량 상세나 목록) 결정
        return "redirect:/userList"; // 혹은 carDetail?carInfoId=carInfoId
    }

    // [B] 찜 해제
    @PostMapping("/remove")
    public String removeWishlist(@RequestParam("carInfoId") Integer carInfoId,
                                 HttpSession session) {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/login";
        }
        wishlistService.removeWishlist(user.getUserId(), carInfoId);
        return "redirect:/userList"; // 취향에 맞게
    }

    // [C] 내 찜 목록 페이지
    @GetMapping("/list")
    public String myWishlist(HttpSession session, Model model) {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/login";
        }
        List<CarListDto> wishlistCars = wishlistService.getWishlistCars(user.getUserId());
        model.addAttribute("wishlistCars", wishlistCars);
        return "user/myWishlist";
    }
}
