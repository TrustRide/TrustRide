package com.fastcampus.gearshift.controller.admin;

import com.fastcampus.gearshift.dto.NOrderListDto;
import com.fastcampus.gearshift.service.NOrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/admin/orderList/")
public class NAdminOrderController {

    @Autowired
    private NOrderListService orderListService;

    @GetMapping(value = "")
    public String getList(Model model) throws Exception {
        List<NOrderListDto> list = orderListService.orderList();

        if (list == null || list.isEmpty()) {
            throw new RuntimeException("orderList 데이터가 비어있습니다!");
        }

        model.addAttribute("orderList", list);
        return "admin/orderList";
    }
}
