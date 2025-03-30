package com.fastcampus.gearshift.controller.admin;

import com.fastcampus.gearshift.dto.AdminDto;
import com.fastcampus.gearshift.dto.NOrderListDto;
import com.fastcampus.gearshift.service.NOrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/orderList")
public class NAdminOrderController {

    @Autowired
    private NOrderListService orderListService;

    @GetMapping("")
    public String getList(Model model, HttpSession session) throws Exception {
        AdminDto admin = (AdminDto) session.getAttribute("adminUser");

        if (admin == null) {
            session.setAttribute("redirectAfterLogin", "/admin/orderList");
            return "redirect:/login.do";
        }

        List<NOrderListDto> list = orderListService.orderList();

        // 예외 대신 빈 리스트 처리
        if (list == null) {
            list = List.of(); // 자바 9 이상 or Collections.emptyList()도 OK
        }

        model.addAttribute("orderList", list);
        return "admin/orderList";
    }


}
