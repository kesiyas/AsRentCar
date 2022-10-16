package com.kesiyas.spring.AsRentCar.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
		
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
	    http
	            .authorizeRequests()
	            .antMatchers("/rent/**").permitAll()
	            .antMatchers("/rent/user/signup/view").hasRole("ADMIN")
	            .and()
	            .csrf().disable();
	
	    return http.build();
	
	}
	
}
