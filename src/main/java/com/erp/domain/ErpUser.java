package com.erp.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ErpUser {

    private int userId;          
    private String username;     
    private String password;
    private String name;
    private String email;        
    private String role;         
    private String status;       
    private LocalDateTime createdAt;  
    private LocalDateTime updatedAt;  
	
}
