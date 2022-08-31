//
//  Double.swift
//  SwiftCoinList
//
//  Created by Woo Min on 2022/08/31.
//
// Double 숫자를 변환시켜줍니다.

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        //formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2 //소숫점 뒤로 최소 2자리
        formatter.maximumFractionDigits = 2 // 소숫점 뒤로 취대 2자리
        return formatter
    }
    
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        //formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2 //소숫점 뒤로 최소 2자리
        formatter.maximumFractionDigits = 7 // 소숫점 뒤로 최대 7자리
        return formatter
    }
    
    private var  numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toCurrency2() -> String {
        return currencyFormatter2.string(for: self) ?? "$0.00"
    }
    
    func toPercentString() -> String {
        
        //return numberFormatter.string(for: self) + "%" ?? "0.00%"
        //"%"를 붙이려고 했는데 오류가 떠서 아래로 수정
        guard let numberAsString = numberFormatter.string(for: self) else { return "" }
        return numberAsString + "%"
    }
}
