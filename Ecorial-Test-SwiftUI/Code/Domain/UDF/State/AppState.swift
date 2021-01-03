//
//  AppState.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

struct AppState: Reducible {
    
    var allUsers = AllUsers()
    var usersFlow = UsersFlow()
    var usersForm = UsersForm()
    
    mutating func reduce(_ action: AnyAction) {
        allUsers.reduce(action)
        usersFlow.reduce(action)
        usersForm.reduce(action)
    }
    
    
}
