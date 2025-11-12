package com.pro.apigateway.order_service.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderApi {

    @GetMapping("/orders")
    public String getOrders() {
        return "Order Service - List of Orders";
    }
}