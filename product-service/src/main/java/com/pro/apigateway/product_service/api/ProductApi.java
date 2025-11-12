package com.pro.apigateway.product_service.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductApi {

    @GetMapping("/products")
    public String getProducts() {
        return "Product Service - List of Products";
    }
}