//
//  ContentView.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            headerView
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
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
