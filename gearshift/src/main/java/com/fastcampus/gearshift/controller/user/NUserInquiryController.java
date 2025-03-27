package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.InquiryDto;
import com.fastcampus.gearshift.dto.UserDto;
import com.fastcampus.gearshift.service.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

// NUserInquiryController.java
@Controller
@RequestMapping("/user/inquiry")
public class NUserInquiryController {

    @Autowired
    private InquiryService inquiryService;

    @GetMapping({"", "/"})
    public String getMyInquiries(Model model, HttpSession session, HttpServletRequest request) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI());
            return "redirect:/login";
        }

        List<InquiryDto> list = inquiryService.getMyInquiries(loginUser.getUserId());
        model.addAttribute("inquiryList", list);
        return "user/userInquiry";
    }

    @GetMapping("/write")
    public String writeForm(HttpSession session, HttpServletRequest request, Model model) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI());
            return "redirect:/login";
        }

        model.addAttribute("mode", "new");
        return "user/userInquiryForm";
    }

    @PostMapping("/write")
    public String write(InquiryDto inquiryDto, HttpSession session, HttpServletRequest request, RedirectAttributes rattr) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI());
            return "redirect:/login";
        }

        inquiryDto.setUserId(loginUser.getUserId());
        inquiryDto.setUserName(loginUser.getUserName());
        inquiryDto.setUserEmail(loginUser.getUserEmail());

        try {
            inquiryService.write(inquiryDto);
            rattr.addFlashAttribute("msg", "WRT_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "WRT_ERR");
        }
        return "redirect:/user/inquiry";
    }

    @GetMapping("/read")
    public String read(@RequestParam("inquiryId") Integer inquiryId, HttpSession session, HttpServletRequest request, Model model) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI());
            return "redirect:/login";
        }

        InquiryDto inquiry = inquiryService.getInquiryById(inquiryId);
        model.addAttribute("inquiry", inquiry);
        model.addAttribute("commentList", inquiry.getComments());
        model.addAttribute("mode", "view");
        return "user/userInquiryForm";
    }

    @PostMapping("/modify")
    public String modify(InquiryDto inquiryDto, HttpSession session, HttpServletRequest request, RedirectAttributes rattr) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI());
            return "redirect:/login";
        }

        inquiryDto.setUserId(loginUser.getUserId());
        try {
            inquiryService.modify(inquiryDto);
            rattr.addFlashAttribute("msg", "MOD_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "MOD_ERR");
        }
        return "redirect:/user/inquiry/read?inquiryId=" + inquiryDto.getInquiryId();
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("inquiryId") Integer inquiryId, HttpSession session, HttpServletRequest request, RedirectAttributes rattr) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI());
            return "redirect:/login";
        }

        try {
            inquiryService.delete(inquiryId, loginUser.getUserId());
            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/user/inquiry";
    }
}



