package com.fastcampus.gearshift.controller.admin;

import com.fastcampus.gearshift.dto.AdminDto;
import com.fastcampus.gearshift.dto.ReviewDto;
import com.fastcampus.gearshift.dto.SPagingDto;
import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.SAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class SAdminManageController {

    @Autowired
    private SAdminService adminService;


    @GetMapping("/manage")
    public String loadManagePage(@RequestParam(defaultValue = "1") int page, Model model) {
        int totalCount = adminService.getTotalUserCount();
        SPagingDto paging = SPagingDto.fromList(page, totalCount);
        List<AdminDto> admins = adminService.getUsersWithPaging(paging.getOffset(), paging.getLimit());

        model.addAttribute("admins", admins);
        model.addAttribute("paging", paging);
        return "admin/manage";
    }

    @GetMapping("/manage2")
    public String loadManagePage2(Model model) {
        List<AdminDto> admins = adminService.getAllUsers();
        model.addAttribute("admins", admins);
        return "admin/manage";
    }

    @GetMapping("/register")
    public String loadRegisterPage(Model model) {
        return "admin/register";
    }

    @PostMapping("/register")
    public String processRegister(@ModelAttribute AdminDto user, Model model) {
        adminService.registerUser(user);
        return "redirect:/admin/manage";
    }

}
