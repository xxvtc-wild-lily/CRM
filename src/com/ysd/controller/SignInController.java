package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ysd.service.SignInService;

@Controller
public class SignInController {
	
	@Autowired
	private SignInService signInService;
}
