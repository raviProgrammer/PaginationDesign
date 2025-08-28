package com.ravi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Employee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long Id;
	
	@Column(length = 20)
	private String name;
	
	@Column(length = 60)
	private String address;
	
	@Column(length = 20)
	private String email;
	
	@Column(length = 10)
	private Long contact;
	
	private String dateOfBirth;
	private String gender;
	private String designation;
	private String imageName;
}
