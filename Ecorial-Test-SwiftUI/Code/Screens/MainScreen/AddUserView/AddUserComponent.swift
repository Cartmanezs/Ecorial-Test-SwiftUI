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
        var dateStart: Binding<Date>
        var dateEnd: Binding<Date>
        var addUserAction: Command
    }
    
    var props: Props
    
    var body: some View {
        VStack(spacing: 10) {
            Text(String.localized().addUser.title)
                .font(.title)
                .padding(.bottom, 30)
            detailsView
            datePickersView
                .padding(.bottom, 40)
            Button(action: props.addUserAction) {
                Text(String.localized().addUser.buttonTitle)
            }
            .frame(width: 157, height: 43)
            .buttonStyle(MemorialButtonStyle())
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
    }
}

extension AddUserComponent {
    var detailsView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(String.localized().addUser.persName)
                .font(.headline)
            Text(String.localized().addUser.persDescription)
                .font(.subheadline)
            
            TextField(String.localized().addUser.fullName, text: props.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 5)
        }
            .padding(.bottom, 10)
    }
    
    var datePickersView: some View {
        HStack(alignment: .center) {
            VStack {
                Text(String.localized().addUser.startDate)
                    .foregroundColor(.gray)
                DatePicker(
                    "Starting",
                    selection: props.dateStart,
                    displayedComponents: .date
                )
            }
            Spacer()
            VStack {
                Text(String.localized().addUser.endDate)
                    .foregroundColor(.gray)
                DatePicker(
                    "Ending",
                    selection: props.dateEnd,
                    displayedComponents: .date
                )
            }
        }
        .labelsHidden()
    }
}

struct AddUserComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddUserComponent(props:
            .init(
                title: .constant(""),
                dateStart: .constant(Date()),
                dateEnd: .constant(Date()),
                addUserAction: {}
            )
        )
    }
}
