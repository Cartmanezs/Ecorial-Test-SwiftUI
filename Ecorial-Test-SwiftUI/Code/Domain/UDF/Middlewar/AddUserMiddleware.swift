//
//  AddUserMiddleware.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 08.01.2021.
//

import Foundation
import Combine
import SwiftUI_UDF

struct AddUserMiddleware: Middleware {
    var store: AppStore
    var queue: DispatchQueue = DispatchQueue(label: "AddUserMiddleware")
    
    @Boxed private var cancellable: AnyCancellable? = nil
    
    var asObserver: Observer<AppState> {
        Observer(queue: queue) { state in
            self.observe(state: state)
            return .active
        }
    }
    
    func observe(state: AppState) {
        guard cancellable == nil else {
            return
        }
        
        switch state.addUserFlow {
        case .addUser:
            let addUserEffect = AddUserEffect(
                queue: queue,
                formData: .init(
                    id: UserInfo.Id.init(value: state.allUsers.byId.count),
                    name: state.addUserForm.name,
                    description: "test",
                    dateStart: state.addUserForm.dateStart,
                    dateEnd: state.addUserForm.dateEnd,
                    image: "background",
                    userPhoto: "userPhoto",
                    userStatus: .none
                ),
                errorId: AddUserFlow.id
            )

            self.cancellable = addUserEffect.upstream().sink { action in
                self.cancellable = nil
                self.store.dispatch(action: action)
                print(action)
            }
            
        default:
            break
        }
    }
}


struct AddUserEffect<ErrorId: Hashable>: Effect {
    let queue: DispatchQueue
    let formData: UserInfo
    let errorId: ErrorId

    init(queue: DispatchQueue = DispatchQueue(label: "Add User Effect queue"),formData: UserInfo, errorId: ErrorId) {
        self.queue = queue
        self.formData = formData
        self.errorId = errorId
    }
            
    func upstream() -> AnyPublisher<AnyAction, Never> {

        Just(formData)
            .receive(on: queue)
            .map { _ in AnyAction.DidUserAdded(
                user: UserInfo
                    .init(
                        id: formData.id,
                        name: formData.name,
                        description: "Test added item",
                        dateStart: formData.dateStart,
                        dateEnd: formData.dateEnd,
                        image: "background",
                        userPhoto: "userPhoto",
                        userStatus: .none
                    )
                )
                .eraseToAnyAction()
            }
            .catch { Just(AnyAction.Error(error: $0.localizedDescription, id: self.errorId).eraseToAnyAction()) }
            .eraseToAnyPublisher()
    }
}
