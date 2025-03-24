package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.NUserFormDto;
import com.fastcampus.gearshift.service.NUserFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class NUserFormController {

    @Autowired
    private NUserFormService userFormService;

    // 사용자 프로필 조회 (GET 요청)
    @GetMapping("/user/userForm")
    public String getUserForm(@SessionAttribute(value = "userId", required = false) Integer userId, Model model) {
        // userId가 세션에 없으면 로그인 페이지로 리다이렉트
        if (userId == null) {
            return "redirect:/login";
        }

        NUserFormDto userForm = userFormService.getUserFormById(userId); // 사용자 정보 조회

        if (userForm == null) {
            throw new RuntimeException("사용자 정보가 존재하지 않습니다!");
        }

        model.addAttribute("user", userForm); // userFormDto를 모델에 담기
        return "user/userForm"; // JSP 파일로 데이터 전달
    }

    // 사용자 정보 수정 (POST 요청)
    @PostMapping("/user/userForm")
    public String updateUserForm(@SessionAttribute(value = "userId", required = false) Integer userId,
                                 @ModelAttribute NUserFormDto updatedUserForm, Model model) {
        // userId가 세션에 없으면 로그인 페이지로 리다이렉트
        if (userId == null) {
            return "redirect:/login";
        }

        try {
            userFormService.updateUserForm(userId, updatedUserForm); // 사용자 정보 수정
            model.addAttribute("message", "회원 정보가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            model.addAttribute("message", "회원 정보 수정에 실패했습니다.");
        }

        return "user/userForm"; // 수정 후 다시 페이지를 보여줌
    }

    // 사용자 탈퇴 처리 (POST 요청)
    @PostMapping("/user/delete")
    public String deleteUser(@SessionAttribute(value = "userId", required = false) Integer userId, Model model) {
        // userId가 세션에 없으면 로그인 페이지로 리다이렉트
        if (userId == null) {
            return "redirect:/login";
        }

        try {
            userFormService.deleteUser(userId); // 사용자 탈퇴
            model.addAttribute("message", "회원 탈퇴가 완료되었습니다.");
        } catch (Exception e) {
            model.addAttribute("message", "회원 탈퇴에 실패했습니다.");
        }

        return "user/userForm"; // 탈퇴 후 다시 페이지를 보여줌
    }
}

