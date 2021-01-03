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
    var dateStart: Date = Date()
    var dateEnd: Date = Date()
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case let action as AnyAction.SelectUserDetails:
            selectedUser = action.user
        case let action as AnyAction.SetUserDetailsNavigation:
            isNavigateToDetails = action.isPresented
        case let action as AnyAction.UpdateDateStart:
            dateStart = action.date
        case let action as AnyAction.UpdateDateEnd:
            dateEnd = action.date
        default:
            break
        }
    }
}
