//
//  Date.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 08.01.2021.
//

import Foundation

extension Date {
    var asISODateString: String {
        return DateFormatter.isoDate.string(from: self)
    }
}
