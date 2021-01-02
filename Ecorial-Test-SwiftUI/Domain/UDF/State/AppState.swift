//
//  AppState.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

struct AppState: Reducible {
    
    var allProjects = AllUsers()
    var projectsFlow = UsersFlow()
    var projectsForm = UsersForm()
    
    mutating func reduce(_ action: AnyAction) {
        allProjects.reduce(action)
        projectsFlow.reduce(action)
        projectsForm.reduce(action)
    }
    
    
}
