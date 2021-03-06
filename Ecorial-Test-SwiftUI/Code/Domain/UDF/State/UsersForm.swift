//
//  ProjectsForm.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

struct UsersForm: Reducible {
    var selectedUser: UserInfo.Id = .init(value: 0)
    var isNavigateToDetails: Bool = false
    var users: [UserInfo] = []
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        
        case let action as AnyAction.SelectUserDetails:
            selectedUser = action.user
            
        case let action as AnyAction.SetUserDetailsNavigation:
            isNavigateToDetails = action.isPresented
        
        case let action as AnyAction.DidUserAdded:
            users.append(action.user)
            
        default:
            break
        }
    }
}
