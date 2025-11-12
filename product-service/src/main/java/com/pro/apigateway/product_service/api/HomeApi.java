package com.pro.apigateway.product_service.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping({"", "/"})
public class HomeApi {

	@GetMapping({"", "/"})
	public String index() {
		return "Product Service is Online...";
	}
}