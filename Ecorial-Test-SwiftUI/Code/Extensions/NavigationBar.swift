//
//  NavigationBar.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 03.01.2021.
//

import SwiftUI

extension View {
    func hideNavigationBar(backButtonHidden: Bool = true) -> some View {
        self
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(backButtonHidden)
    }
}
