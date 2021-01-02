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
    }
    
    var props: Props
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .lastTextBaseline, spacing: 7) {
                Text("Add a Project")
                   // .font(.sfProDisplaySemibold(size: 24))
                Text("(1/2)")
                  //  .font(.sfProDisplaySemibold(size: 14))
            }
            Text("String.localized().common.addDetails")
              //  .font(.sfProDisplayRegular(size: 16))
                //.foregroundColor(.ctrlGray)

            VStack(alignment: .leading, spacing: 10) {
                Text("title")
                TextField("projectTitleField", text: props.title)
                   // .textFieldStyle(UnderlinedTextFieldStyle())
                   // .font(.sfProDisplaySemibold(size: 16))
                    .padding(.bottom, 5)
                
                Text("String.localized().common.tags")

                Text("String.localized().common.amount")
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
       // .hideKeyboardByTap()
    //    .keyboardAvoidingPadding()
    }
}

struct AddUserComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddUserComponent(props:
            .init(
                title: .constant("")
                
            )
        )
    }
}
