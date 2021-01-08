//
//  AddUserMiddleware.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 08.01.2021.
//

import Foundation
import Combine
import SwiftUI_UDF
//import PlaidBankAPI

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
            Just(UserInfo.fakeItems())
       // ExpensesAPIClient.addExpensePublisher(token: token, formData: formData)
            .receive(on: queue)
            .map { _ in AnyAction.DidUserAdded().eraseToAnyAction() }
            .catch { Just(AnyAction.Error(error: $0.localizedDescription, id: self.errorId).eraseToAnyAction()) }
            .eraseToAnyPublisher()
    }
}

//        switch state.transactionsFlow {
//        case .loading:
//            let effect = TransactionsEffect(queue: queue, token: state.userCredentials.token, errorId: TransactionsFlow.id)
//            self.cancellable = effect.upstream().sink { action in
//                self.cancellable = nil
//                self.store.dispatch(action: action)
//            }
//            
//        default:
//            break
//        }
//    }
//}
//
//struct TransactionsEffect<ErrorId: Hashable>: Effect {
//    let token: String
//    let queue: DispatchQueue
//    let errorId: ErrorId
//    
//    init(queue: DispatchQueue = DispatchQueue(label: "Transactions queue"), token: String, errorId: ErrorId) {
//        self.queue = queue
//        self.errorId = errorId
//        self.token = token
//    }
//    
//    func upstream() -> AnyPublisher<AnyAction, Never> {
//            Just(Transaction.fakeItems())
//            .map {  AnyAction.DidLoadItems(items: $0, id: AccountsFlow.id).eraseToAnyAction() }
////            TODO
////        UserDataAPIClient.transactionsPublisher(token: token)
////            .map { AnyAction.DidLoadItems(items: $0.map(\.asTransaction), id: AccountsFlow.id).eraseToAnyAction() }
//            .catch { Just(AnyAction.Error(error: $0.localizedDescription, id: self.errorId).eraseToAnyAction()) }
//            .receive(on: queue)
//            .eraseToAnyPublisher()
//    }
//}

import Foundation

public struct AddUserFormData {
    let title: String
    let dateStart: String
    let dateEnd: String
    
    public init(title: String, dateStart: String, dateEnd: String) {
        self.title = title
        self.dateStart = dateStart
        self.dateEnd = dateEnd
    }
}
