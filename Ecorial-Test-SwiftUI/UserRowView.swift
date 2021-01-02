//
//  UserRowView.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI

struct UserRowView: View {
    let user: UserInfo
    
    var body: some View {
        ZStack {
            Image(user.image).resizable().edgesIgnoringSafeArea(.bottom)

            BlurView(
                effect: .systemMaterialDark)
                .frame(height:100)
                .padding()
        }
        .cornerRadius(10)
        
    }
}


struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: UserInfo.fakeItem())
            .previewLayout(.fixed(width: 347, height: 291))
    }
}
