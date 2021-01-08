//
//  AddUserFlow.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 08.01.2021.
//

import Foundation
import SwiftUI_UDF

enum AddUserFlow: IdentifiableFlow {
    case none, addUser
    
    init() { self = .none }
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case is AnyAction.AddUser:
            self = .addUser
            
        case is AnyAction.DidUserAdded:
            self = .none
            
        case let action as AnyAction.Error where action.id == Self.id:
            self = .none
            
        default:
            break
        }
    }
}

