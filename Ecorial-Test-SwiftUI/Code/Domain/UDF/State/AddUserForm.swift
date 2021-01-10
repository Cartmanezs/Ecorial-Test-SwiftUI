//
//  AddUserForm.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 08.01.2021.
//

import Foundation
import SwiftUI
import SwiftUI_UDF

struct AddUserForm: Reducible {
    var name: String = ""
    var dateStart: Date = Date()
    var dateEnd: Date = Date()
    var error: String? = nil
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        
        case let action as AnyAction.UpdateUserTitle:
            name = action.text
            
        case let action as AnyAction.UpdateDateStart:
            dateStart = action.date
            
        case let action as AnyAction.UpdateDateEnd:
            dateEnd = action.date
            
        case is AnyAction.ResetAddUserForm:
            self = Self()

        case let action as AnyAction.Error where action.id == AddUserFlow.id:
            error = action.error
            
        default:
            break
        }
    }
}

//MARK: - Computed Properties
extension AddUserForm {
    var isAddUserEnabled: Bool {
        !name.isEmpty
    }
}

