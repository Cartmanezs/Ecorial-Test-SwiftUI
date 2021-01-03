//
//  Binding.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI

public extension Binding where Value == Bool {
    
    func toggleAction() -> () -> Void {
        return {
            self.wrappedValue.toggle()
        }
    }
    
    func animationToggleAction(_ animation: Animation = .easeInOut) -> () -> Void {
        return {
            withAnimation(animation) {
                self.wrappedValue.toggle()
            }
        }
    }
}
