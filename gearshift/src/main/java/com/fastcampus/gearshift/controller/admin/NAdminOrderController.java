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

        if (list == null || list.isEmpty()) {
            throw new RuntimeException("orderList 데이터가 비어있습니다!");
        }

        model.addAttribute("orderList", list);
        return "admin/orderList";
    }
}
