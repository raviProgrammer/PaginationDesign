package com.ravi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class PaginationDesignApplication implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/addImages/**").addResourceLocations("/WEB-INF/");
	}

	public static void main(String[] args) {
		SpringApplication.run(PaginationDesignApplication.class, args);
	}

}