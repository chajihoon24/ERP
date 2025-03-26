package com.erp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayrollRecord {
	
    private int id;                 // 고유한 식별자 (기본 키)
    private int employeeId;         // 직원 아이디
    private int basicSalary;        // 기본급
    private int bonus;              // 보너스
    private int positionAllowance;  // 직책 수당
    private int nightWorkHours;     // 야근 시간
    private int specialAllowance;   // 특수 수당
    private int reportYear;         // 신고 연도
    private int reportMonth;        // 신고 월
    private boolean transferStatus; // 이체 여부 (TRUE/FALSE)
	private int realTotal;
	private String name;
	private String bank;
	private String acount;
	private String rrn;
	
}
