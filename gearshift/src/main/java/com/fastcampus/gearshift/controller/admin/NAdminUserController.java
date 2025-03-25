package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.NUserListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/userList")
public class NAdminUserController {

    @Autowired
    private NUserListService userListService;

    // 회원 목록 조회
    @GetMapping("")
    public String getList(Model model) {
        List<UserDto> list = userListService.userList();
        model.addAttribute("userList", list);
        return "admin/userList";
    }

    // 관리자에 의한 회원 삭제
    @PostMapping("/delete")
    public String deleteUser(@RequestParam("userId") Integer userId,
                             RedirectAttributes redirectAttributes) {
        try {
            userListService.deleteUser(userId);
            redirectAttributes.addFlashAttribute("message", "회원 삭제가 완료되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "회원 삭제에 실패했습니다.");
        }

        return "redirect:/admin/userList";
    }
}
