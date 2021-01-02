//
//  ContentView.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isUserSettings: Bool = true


    var body: some View {
        VStack {
            headerView
            if self.isUserSettings {
                Text("54")
                    .padding(.top, 20)
            } else {
                Text("")
            }
        }
    }
}

extension ContentView {
    var headerView: some View {
        VStack(alignment: .center) {
            HStack(spacing: 22) {
                Spacer()
                Text("My Memorials")
                Spacer()
                Button(action: {}) {
                    Image.addIcon
                }
                .padding(.trailing, 10)
            }
            .padding(.leading, 50)
        }
    }
    
    
    var segmentedControl: some View {

        GeometryReader  { proxy in
            ZStack(alignment: isUserSettings ? .leading : .trailing) {
                Color.gray
                LinearGradient(
                    gradient: Gradient(
                        colors: [.red, .white]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: proxy.size.width / 2, height: proxy.size.height - 4)
                .cornerRadius(13)
                
                HStack{
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.isUserSettings = true
                        }
                    }) {
                        Text("Created")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(isUserSettings ? .white : .gray)
                    }
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.isUserSettings = false
                        }
                    }) {
                        Text("Favourite")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(isUserSettings ? .gray : .white)
                    }
                }
            }
        }
        .cornerRadius(13)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
