//
//  AddUserMiddlewar.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 08.01.2021.
//

import Foundation
import Combine
import SwiftUI_UDF

struct AddUserMiddleware: Middleware {
    var store: AppStore
    var queue = DispatchQueue(label: "AddUserMiddleware")
    
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
        case .loading:
            self.cancellable = LoadItemsEffect(queue: queue, id: UsersFlow.id).upstream().sink { action in
                self.cancellable = nil
                self.store.dispatch(action: action)
            }
            
        default:
            break
        }
    }
}

struct LoadItemsEffect<Id: Hashable>: Effect {
    let queue: DispatchQueue
    let id: Id
    
    init(queue: DispatchQueue = DispatchQueue(label: "Load items queue"), id: Id) {
        self.queue = queue
        self.id = id
    }
    
    func upstream() -> AnyPublisher<AnyAction, Never> {
        let userInfo = UserInfo.fakeItems()
        let group = ActionGroup(
            anyActions: [
                AnyAction(AnyAction.DidLoadItems(items: userInfo, id: id)),
              //  AnyAction(AnyAction.UpdateUserInfo(userName: "Some user data"))
            ]
        )
        
        return Just(group.eraseToAnyAction())
            .receive(on: queue)
            .delay(for: 3, scheduler: queue)
            .eraseToAnyPublisher()
    }
}
