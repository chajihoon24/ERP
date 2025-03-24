package com.erp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InsuranceTax {
	
    private double NPS;            // 국민연금
    private double NHI;            // 건강보험
    private double LTCI;           // 장기요양보험
    private double EI;             // 고용보험
    private double incomeTax;      // 소득세
    private double localIncomeTax; // 지방소득세

}
