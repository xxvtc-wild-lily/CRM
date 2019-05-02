package com.ysd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.SignInMapper;

@Service
public class SignInServiceImpl implements SignInService {
	
	@Autowired
	private SignInMapper signInMapper;
}
