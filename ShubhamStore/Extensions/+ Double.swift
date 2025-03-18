//
//  + Double.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 22/02/25.
//

import Foundation

extension Double {
    
    /// Convert a Double into a  Currency with 2-6 Decimal values
    ///
    /// ```
    /// Converts 123.5432 to $123.54
    /// ```
    ///
    private var currencyFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
//        formatter.locale = .current
//        formatter.currencyCode = "INR"
//        formatter.currencySymbol = "₹"
        return formatter
    }
    
    
    func asCurrencyWith6Decimal() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    /// Convert a Double into a  String Reprsentation
    ///
    /// ```
    /// Converts 1.5432 to "1.54"
    /// ```
    func asNumberString() -> String {
        return  String(format: "%.2f", self)
    }
    
    func asPercentageString() -> String {
        return  asNumberString() + "%"
    }
}
