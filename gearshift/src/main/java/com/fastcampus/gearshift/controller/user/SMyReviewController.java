package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.ReviewDto;
import com.fastcampus.gearshift.dto.SOrderDto;
import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.SOrderService;
import com.fastcampus.gearshift.service.SReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage/review")
public class SMyReviewController {

    @Autowired
    SOrderService orderService;

    @Autowired
    SReviewService reviewService;

    @GetMapping("/list")
    public String loadReviewPage(HttpSession session, Model model) {
        Integer userId = ((UserDto) session.getAttribute("loginUser")).getUserId();
        List<SOrderDto> orders = orderService.getCompletedOrdersWithReviewStatus(userId);
        model.addAttribute("orders", orders);
        return "user/userReview";
    }

    @PostMapping("/register")
    public String loadReviewWritePage(@RequestParam("orderId") Integer orderId,
                                      @RequestParam("carInfoId") String carInfoId,
                                      @RequestParam("modelName") String modelName,
                                      @RequestParam("orderCompletedDate") String orderCompletedDate,
                                      Model model) {
        model.addAttribute("orderId", orderId);
        model.addAttribute("carInfoId", carInfoId);
        model.addAttribute("modelName", modelName);
        model.addAttribute("orderCompletedDate", orderCompletedDate);
        return "user/userReviewWrite";
    }

    @PostMapping("/register/{orderId}")
    public String registerReview(HttpSession session,
                                 @PathVariable Integer orderId,
                                 @ModelAttribute ReviewDto reviewDto,
                                 @RequestParam(value = "image", required = false) MultipartFile image,
                                 RedirectAttributes redirectAttributes) {
        Integer userId = ((UserDto) session.getAttribute("loginUser")).getUserId();
        System.out.println("image = " + image);
        reviewDto.setOrderId(orderId);
        reviewDto.setUserId(userId);
        reviewService.registerReview(reviewDto, image);
        return "redirect:/mypage/review/list"; // 등록 후 리뷰 목록으로 이동
    }

    @PostMapping("/delete/{orderId}")
    public String deleteReview(@PathVariable Integer orderId, RedirectAttributes redirectAttributes) {
        reviewService.deleteReview(orderId);
        redirectAttributes.addFlashAttribute("message", "삭제가 완료되었습니다.");
        return "redirect:/mypage/review/list"; // 등록 후 리뷰 목록으로 이동
    }

}
