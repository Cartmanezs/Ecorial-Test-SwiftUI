//
//  DateFormatter.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation

extension DateFormatter {
    static let iso8601: ISO8601DateFormatter = .init()
    static let isoDateStringFormat = "yyyy-MM-dd"
    
    static let medium: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    static let full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    static let isoDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = isoDateStringFormat
        return formatter
    }()
}
