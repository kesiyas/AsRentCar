package com.kesiyas.spring.AsRentCar.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hello")
public class HelloController {

	public String hello() {
		return "user/hello";
	}
	
	@GetMapping("/view")
	public String jsp_test() {
		return "test/hello";
	}
	
	
}
