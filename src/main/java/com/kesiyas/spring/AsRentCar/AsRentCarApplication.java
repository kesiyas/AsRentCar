package com.kesiyas.spring.AsRentCar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class AsRentCarApplication {

	public static void main(String[] args) {
		SpringApplication.run(AsRentCarApplication.class, args);
	}

}
