//
//  AddUserContainer .swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI
import SwiftUI_UDF

struct AddUserContainer: Container {
    typealias ContainerComponent = AddUserComponent
    
    @Environment(\.presentationMode) var presentationMode
    
    func map(state: AppState, store: AppEnvironmentStore) -> ContainerComponent.Props {
        .init(
            title: Binding(
                get: { state.usersForm.title },
                set: { store.dispatch(AnyAction.UpdateUserTitle(text: $0)) }
            ),
            dateStart: Binding(
                get: { state.usersForm.dateStart },
                set: { store.dispatch(AnyAction.UpdateDateStart(date: $0)) }
            ),
            dateEnd: Binding(
                get: { state.usersForm.dateEnd },
                set: { store.dispatch(AnyAction.UpdateDateEnd(date: $0)) }
            ),
            addUserAction:  { addUserAction(store: store) },
            buttonTitle: "Add memorial"
        )
    }
    func onContainerAppear(store: EnvironmentStore<AppState>) {

    }
}

private extension AddUserContainer {
    func addUserAction(store: AppEnvironmentStore) {
        store.dispatch(AnyAction.AddUser())
        presentationMode.wrappedValue.dismiss()
    }
}
