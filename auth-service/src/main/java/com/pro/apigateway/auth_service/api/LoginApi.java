package com.pro.apigateway.auth_service.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginApi {

	@GetMapping("/login")
	public String login() {
		return "Login Service - Success";
	}
}