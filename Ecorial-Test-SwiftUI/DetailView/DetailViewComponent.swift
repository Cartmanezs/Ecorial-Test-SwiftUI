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
        ZStack {
            Image(props.user.image).aspectFill().edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: self.presentationMode.dismissAction() ) {
                        Image.backIcon
                    }
                    Spacer()
                    Button(action: {} ) {
                        Image.favIcon
                    }
                    .padding(.trailing, 10)
                    .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
                }
                .padding(.top, 20)
                .padding(.horizontal, 10)
                
                Spacer()
                
                userDetails
                buttons
            }
        }
        .hideNavigationBar()
    }
}

extension DetailViewComponent {
    var userDetails: some View {
        VStack(alignment: .leading, spacing: 7) {
            Image(props.user.userPhoto)
                .resizable()
                .aspectFill()
                .frame(width: 174, height: 174)
                .clipShape( RoundedRectangle(cornerRadius: 40))
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 3)
                )
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(props.user.name)
                        .font(.system(size: 36))
                    Text(props.user.description)
                        .font(.system(size: 17))
                    HStack(spacing: 0) {
                        Text("\(DateFormatter.full.string(from: props.user.dateStart)) to ")
                        Text(DateFormatter.full.string(from: props.user.dateEnd))
                    }
                    .font(.system(size: 11))
                }
                .foregroundColor(.white)
            }
        }
        .padding(.bottom, 30)
        .padding(.leading, -60)
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
        .padding(.bottom, 40)
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
