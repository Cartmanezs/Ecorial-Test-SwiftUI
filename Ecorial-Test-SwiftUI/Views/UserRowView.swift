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
            Image(user.image).resizable().frame(height: 288)
            descriptionView
        }
        .cornerRadius(10)
        .padding()
    }
}

extension UserRowView {
    var descriptionView: some View {
        ZStack {
            BlurView(effect: .systemMaterialDark)
                .frame(height:93)
                .offset(y: 100)
            userBio
                .offset(y: 45)
                .padding(.leading, -50)
        }
    }
    
    var userBio: some View {
        VStack(alignment: .leading, spacing: 7) {
            Image(user.userPhoto)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.white, lineWidth: 2)
                )
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(user.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(user.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text(DateFormatter.full.string(from: user.date))
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: UserInfo.fakeItem())
            .previewLayout(.fixed(width: 347, height: 288))
    }
}
