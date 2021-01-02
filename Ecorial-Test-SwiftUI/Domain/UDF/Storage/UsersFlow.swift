//
//  ProjectsFlow.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

enum UsersFlow: IdentifiableFlow {
    case none
    
    init() { self = .none }
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case let action as AnyAction.DidLoadItems<UserInfo> where action.id == UsersFlow.id:
            self = .none
            
        case let action as AnyAction.Error where action.id == UsersFlow.id:
            self = .none
            
        default:
            break
        }
    }
}