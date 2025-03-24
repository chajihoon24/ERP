package com.erp.serviceImpl;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.springframework.stereotype.Service;

import com.erp.domain.InsuranceTax;
import com.erp.service.LIService;

@Service
public class NIServiceImpl implements LIService {

    // 국민연금 (National Pension Service)
    private final double NPS = 0.13;

    // 건강보험 (National Health Insurance)
    private final double NHI = 0.8;

    // 장기요양보험 (Long-Term Care Insurance)
    private final double LTCI = NHI * 0.13;

    // 고용보험 (Employment Insurance)
    private final double EI = 0.2;

    // 소득세 (Income Tax)
    private final double incomeTax = 0.1;

    // 지방소득세 (Local Income Tax)
    private final double localIncomeTax = incomeTax * 0.1;

    private double roundToTwoDecimals(double value) {
        return new BigDecimal(value).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    @Override
    public InsuranceTax getInsuranceTaxInfo() {
        return new InsuranceTax(
            roundToTwoDecimals(NPS),
            roundToTwoDecimals(NHI),
            roundToTwoDecimals(LTCI),
            roundToTwoDecimals(EI),
            roundToTwoDecimals(incomeTax),
            roundToTwoDecimals(localIncomeTax)
        );
    }
}
