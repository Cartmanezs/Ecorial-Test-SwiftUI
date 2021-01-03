//
//  AddUserComponent.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI
import SwiftUI_UDF

struct AddUserComponent: Component {
    struct Props {
        var title: Binding<String>
        var date: Binding<Date>
        var addUserAction: Command
        var buttonTitle: String
    }
    
    var props: Props
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Create Memorial")
                .font(.title)
                .padding(.bottom, 30)
            VStack(alignment: .leading, spacing: 15) {
                Text("Person’s name")
                    .font(.headline)
                Text("Each memorial is dedicated to a person. Input the full name in the field below.")
                    .font(.subheadline)
                
                TextField("Full Name", text: props.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 5)
                DatePicker(
                    "date",
                    selection: props.date,
                    displayedComponents: .date
                )
            }
            .padding(.bottom, 40)
            
            Button(action: props.addUserAction) {
                Text(props.buttonTitle)
            }
            .frame(width: 157, height: 43)
            .buttonStyle(MemorialButtonStyle())
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
    }
}

struct AddUserComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddUserComponent(props:
            .init(
                title: .constant(""),
                date: .constant(Date()),
                addUserAction: {},
                buttonTitle: "Create memorial"
            )
        )
    }
}
