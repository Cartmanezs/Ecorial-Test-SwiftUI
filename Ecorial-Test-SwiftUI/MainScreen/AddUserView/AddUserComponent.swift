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
    }
    
    var props: Props
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Create Memorial")
                .font(.headline)

            VStack(alignment: .leading, spacing: 10) {
                Text("Person’s name")
                    .font(.headline)
                Text("Each memorial is dedicated to a person. Input the full name in the field below.")
                    .font(.subheadline)
                
                TextField("Full Name", text: props.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 5)
                DatePicker(
                    "String.localized().common.date",
                    selection: props.date,
                    displayedComponents: .date
                )
//                TextFieldNumeric(String.localized().common.enterAnAmount, value: 54)//props.amount)
//                    .textFieldStyle(UnderlinedTextFieldStyle())
//                    .font(.sfProDisplaySemibold(size: 16))
//                    .padding(.bottom, 5)
                
//                DatePicker(
//                    String.localized().common.date,
//                    selection: props.date,
//                    displayedComponents: .date
//                )
//                .accentColor(.ctrlGray)
            }
           // .font(.sfProDisplaySemibold(size: 11))
            //.foregroundColor(.ctrlPlaceholderGray)
        }
        .padding(.top, 10)
        .padding(.horizontal, 25)
    }
}

struct AddUserComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddUserComponent(props:
            .init(
                title: .constant(""),
                date: .constant(Date())
            )
        )
    }
}
