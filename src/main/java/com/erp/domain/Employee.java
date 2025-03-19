package com.erp.domain;

import java.time.LocalDate;

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
	private LocalDate hireDate;
	private LocalDate resignationDate;
	private String status;
	private String workLocation;
	private String position;

}
