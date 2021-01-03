//
//  MemorialButtonStyle.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 03.01.2021.
//

import SwiftUI

struct MemorialButtonStyle: ButtonStyle {
    var isEnabled: Bool = true
    var font: Font = .subheadline
    var height: CGFloat? = 42
    var cornerRadius: CGFloat = 25
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(font)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background(Color.ecoBlue)
            .cornerRadius(cornerRadius)
            .opacity(isEnabled ? 1.0 : 0.35)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: Color.gray.opacity(0.3), radius: 6, x: 0, y: 3)
    }
}

