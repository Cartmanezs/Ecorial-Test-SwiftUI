//
//  DetailViewComponent.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 03.01.2021.
//

import SwiftUI
import SwiftUI_UDF

struct DetailViewComponent: Component {
    
    struct Props {
        var user: UserInfo
    }
    
    var props: Props
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: self.presentationMode.dismissAction() ) {
                    Image.backIcon
                }
                Spacer()
                Button(action: {} ) {
                    Image.favIcon
                }
                .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
            }
            .padding(.horizontal, 15)
            Spacer()
            userDetails
            buttons
        }
        .background(Image(props.user.image))
    }
}

extension DetailViewComponent {
    var userDetails: some View {
        VStack(alignment: .leading, spacing: 7) {
            Image(props.user.userPhoto)
                .resizable()
                .aspectFill()
                .frame(width: 174, height: 174)
                .clipShape( RoundedRectangle(cornerRadius: 22))
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.white, lineWidth: 2)
                )
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(props.user.name)
                        .font(.system(size: 36))
                    Text(props.user.description)
                        .font(.system(size: 17))
                    Text(DateFormatter.full.string(from: props.user.date))
                        .font(.system(size: 17))
                }
                .foregroundColor(.white)
            }
        }
        .padding(.bottom, 20)
        .padding(.leading, -70)
    }
    
    var buttons: some View {
        HStack {
            ToolButton(
                action: {},
                iconName: "camera",
                text: "Add memories"
            )
            ToolButton(
                action: {},
                iconName: "square.and.pencil",
                text: "Sign questbook"
            )
            ToolButton(
                action: {},
                iconName: "square.and.arrow.up",
                text: "Share memorial"
            )
        }
        .padding(.bottom, 20)
    }
    struct ToolButton: View {
        var action: Command
        var iconName: String
        var text: String
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .frame(
                            width: 105,
                            height: 64,
                            alignment: .center
                        )
                    VStack(spacing: 6) {
                        Image(systemName: iconName)
                            .resizable()
                            .aspectFill()
                            .frame(width: 20, height: 30)
                        Text(text)
                            .font(.system(size: 12))
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}


struct DetailViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewComponent(props: .init(user: UserInfo.fakeItem()))
    }
}
