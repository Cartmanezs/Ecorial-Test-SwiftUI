//
//  ProjectsForm.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

struct UsersForm: Reducible {
    var selectedUser: UserInfo.Id = .init(value: "")
    var isNavigateToDetails: Bool = false
    var date: Date = Date()
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case let action as AnyAction.SelectUserDetails:
            selectedUser = action.user
        case let action as AnyAction.SetUserDetailsNavigation:
            isNavigateToDetails = action.isPresented
            
        case let action as AnyAction.UpdateExpenseDate:
            date = action.date
        default:
            break
        }
    }
}
