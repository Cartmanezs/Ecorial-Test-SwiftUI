//
//  UserRowView.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI
import SwiftUI_Kit

struct UserRowView: View {
    
    let user: UserInfo
    
    var body: some View {
        ZStack {
            Image(user.image)
                .resizable()
                .aspectFill()
                .frame(height: 288)
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
                .padding(.leading, -10)
            if user.userStatus == .favorite {
                likedStatusView
            }
        }
    }
    
    var likedStatusView: some View {
        Image.favIcon
            .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
            .offset(x: 120, y: -100)
    }
    
    var userBio: some View {
        VStack(alignment: .leading, spacing: 7) {
            Image(user.userPhoto)
                .resizable()
                .aspectFill()
                .frame(width: 101, height: 101)
                .clipShape(  RoundedRectangle(cornerRadius: 25))
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
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
                    HStack(spacing: 0) {
                        Text("\(DateFormatter.full.string(from: user.dateStart)) to ")
                        Text(DateFormatter.full.string(from: user.dateEnd))
                    }
                    .foregroundColor(.gray)
                    .font(.system(size: 11))
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
