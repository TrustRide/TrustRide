package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.IssuedCouponDto;
import com.fastcampus.gearshift.service.JIssuedCouponService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user/coupons")
@RequiredArgsConstructor
public class JIssuedCouponController {

    private final JIssuedCouponService jIssuedCouponService;



    @GetMapping("/list/{userId}")
    public String listUserCoupons(@PathVariable Integer userId,Model model) {
        System.out.println("[컨트롤러] /user/coupons/list" + userId);
        
        // HttpSession session 로그인과 연결하면 @PathVariable 대신 session으로 사용해야함
//        Integer userId = (Integer)session.getAttribute("userId");
        
        
        List<IssuedCouponDto> userCoupons = jIssuedCouponService.getUserCoupons(userId);
        model.addAttribute("userCoupons", userCoupons);
        model.addAttribute("userId", userId);

        return "user/userCouponList";
    }

    @PostMapping("/use")
    public String useCoupon(@RequestParam Integer issuedId,
                            @RequestParam Integer userId,
                            RedirectAttributes redirectAttributes) {
        System.out.println("[컨트롤러] /user/coupons/use, issuedId=" + issuedId + ", userId=" + userId);
        try {
            jIssuedCouponService.useCoupon(issuedId, userId);
            redirectAttributes.addFlashAttribute("successMessage", "쿠폰을 성공적으로 사용했습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "쿠폰 사용 중 오류가 발생했습니다.");
        }

        return "redirect:/user/coupons/list/" + userId;
    }
}
