package com.ravi.DTO;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeDTO {
	private String name;
	private String address;
	private String email;
	private Long contact;
	private String dateOfBirth;
	private String gender;
	private String designation;
	private MultipartFile image_name;
}
