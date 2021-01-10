//
//  UIDevice.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 10.01.2021.
//

import UIKit

extension UIDevice {
    
    static var isIPhone8: Bool {
        return (UIScreen.main.bounds.size.height == 667)
    }
}
