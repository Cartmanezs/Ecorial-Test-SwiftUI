//
//  AddUserMiddlewar.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 08.01.2021.
//

import Foundation
import Combine
import SwiftUI_UDF

struct UserItemsMiddleware: Middleware {
    var store: AppStore
    var queue = DispatchQueue(label: "UserItemsMiddleware")
    
    @Boxed private var cancellable: AnyCancellable? = nil
    
    var asObserver: Observer<AppState> {
        Observer(queue: queue) { state in
            self.observe(state: state)
            return state.allUsers.byId.isEmpty ? .active : .dead
        }
    }
    
    func observe(state: AppState) {
        guard cancellable == nil else {
            return
        }
        
        switch state.usersFlow {
        case .loadingUsersItems:
            self.cancellable = LoadItemsEffect(queue: queue, errorId: UsersFlow.id).upstream().sink { action in
                self.cancellable = nil
                self.store.dispatch(action: action)
            }
            
        default:
            break
        }
    }
}

struct LoadItemsEffect<ErrorId: Hashable>: Effect {
    let queue: DispatchQueue
    let errorId: ErrorId
    
    init(queue: DispatchQueue = DispatchQueue(label: "Load items queue"), errorId: ErrorId) {
        self.queue = queue
        self.errorId = errorId
    }
    
    func upstream() -> AnyPublisher<AnyAction, Never> {
        
         Just(UserInfo.fakeItems())
            .map { AnyAction.DidLoadItems(items: $0, id: UsersFlow.id).eraseToAnyAction() }
            .receive(on: queue)
            .delay(for: 1.0, scheduler: queue)
            .eraseToAnyPublisher()
    }
}
