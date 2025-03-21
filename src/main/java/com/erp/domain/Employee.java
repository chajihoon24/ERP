package com.erp.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Employee {
	
	private int id;
	private String name;
	private String email;
	private int age;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private String hireDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private String resignationDate;
	private String status;
	private String workLocation;
	private String position;
	private String address;
	private String rrn;
	private String tel;
	private String notes;

}
