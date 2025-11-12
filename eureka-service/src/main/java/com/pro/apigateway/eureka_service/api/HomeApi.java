package com.pro.apigateway.eureka_service.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping({"", "/"})
public class HomeApi {

	@GetMapping({"", "/"})
	public String index() {
		return "Eureka Service is Online...";
	}
}