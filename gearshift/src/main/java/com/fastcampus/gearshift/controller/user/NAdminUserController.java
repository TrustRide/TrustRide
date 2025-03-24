package com.fastcampus.gearshift.controller.user;

import com.fastcampus.gearshift.dto.NUserListDto;
import com.fastcampus.gearshift.service.NUserListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class NAdminUserController {

    @Autowired
    private NUserListService userListService;

    @RequestMapping(value = "/admin/userList", method = RequestMethod.GET)
    public String getList(Model model) throws Exception {
        List<NUserListDto> list = userListService.userList();

        if (list == null || list.isEmpty()) {
            throw new RuntimeException("userList 데이터가 비어있습니다!");
        }

        model.addAttribute("userList", list);
        return "admin/userList";
    }
}