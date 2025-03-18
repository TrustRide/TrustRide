package com.fastcampus.gearshift.service;

import com.fastcampus.gearshift.dao.BAdminProductMapper;
import com.fastcampus.gearshift.dto.AdminProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BAdminProductService {

    @Autowired
    private BAdminProductMapper productMapper;

    public List<AdminProductDTO> getAllProducts() {
        return productMapper.selectAllProducts();
    }

    public AdminProductDTO getProductById(int id) {
        return productMapper.selectProductById(id);
    }

    public void updateProduct(AdminProductDTO product) {
        productMapper.updateProduct(product);
    }

    public void deleteProduct(int id) {
        productMapper.deleteProduct(id);
    }
}

