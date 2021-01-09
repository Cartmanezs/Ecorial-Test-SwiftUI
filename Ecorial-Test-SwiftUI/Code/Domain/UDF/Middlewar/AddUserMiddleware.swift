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
                    title: state.addUserForm.title,
                    dateStart: state.addUserForm.dateStart.asISODateString,
                    dateEnd: state.addUserForm.dateEnd.asISODateString
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
    let formData: AddUserFormData
    let errorId: ErrorId

    init(queue: DispatchQueue = DispatchQueue(label: "Add User Effect queue"),formData: AddUserFormData, errorId: ErrorId) {
        self.queue = queue
        self.formData = formData
        self.errorId = errorId
    }
            
    func upstream() -> AnyPublisher<AnyAction, Never> {

        return Just(UserInfo.fakeItems())
            .receive(on: queue)
            .map { _ in AnyAction.DidUserAdded().eraseToAnyAction() }
            .catch { Just(AnyAction.Error(error: $0.localizedDescription, id: self.errorId).eraseToAnyAction()) }
            .eraseToAnyPublisher()
    }
}

public struct AddUserFormData {
    let title: String
    let dateStart: String
    let dateEnd: String
    let description: String = "Soldier, philanthropist, real hero"
    let image: String = "background"
    let userPhoto: String = "userPhoto"
    let userStatus: UserStatus = .none
    
    public init(title: String, dateStart: String, dateEnd: String) {
        self.title = title
        self.dateStart = dateStart
        self.dateEnd = dateEnd
    }
}
