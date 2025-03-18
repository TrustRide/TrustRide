package com.fastcampus.gearshift.controller;

import com.fastcampus.gearshift.dto.AdminProductDTO;
import com.fastcampus.gearshift.service.BAdminProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class BAdminProductController {

    @Autowired
    private BAdminProductService productService;

    // 상품 목록 페이지
    @GetMapping("/list")
    public String list(Model model) {
        List<AdminProductDTO> productList = productService.getAllProducts();
        model.addAttribute("productList", productList);
        return "admin/productList";
    }

    // 상품 수정 페이지
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        AdminProductDTO product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/productEdit";
    }

    // 상품 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute AdminProductDTO product) {
        productService.updateProduct(product);
        return "redirect:/admin/product/list";
    }

    // 상품 삭제 처리
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        productService.deleteProduct(id);
        return "redirect:/admin/product/list";
    }
}

