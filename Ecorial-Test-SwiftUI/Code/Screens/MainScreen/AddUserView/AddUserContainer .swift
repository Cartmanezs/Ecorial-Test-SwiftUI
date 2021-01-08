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
                get: { state.addUserForm.title },
                set: { store.dispatch(AnyAction.UpdateUserTitle(text: $0)) }
            ),
            dateStart: Binding(
                get: { state.addUserForm.dateStart },
                set: { store.dispatch(AnyAction.UpdateDateStart(date: $0)) }
            ),
            dateEnd: Binding(
                get: { state.addUserForm.dateEnd },
                set: { store.dispatch(AnyAction.UpdateDateEnd(date: $0)) }
            ),
            addUserAction:  { addUserAction(store: store) },
            isAddUserEnabled: store.state.addUserForm.isAddUserEnabled
        )
    }
    func onContainerAppear(store: EnvironmentStore<AppState>) {
        store.dispatch(AnyAction.ResetAddUserForm())
    }
}

private extension AddUserContainer {
    func addUserAction(store: AppEnvironmentStore) {
        store.dispatch(AnyAction.AddUser())
        presentationMode.wrappedValue.dismiss()
    }
}
