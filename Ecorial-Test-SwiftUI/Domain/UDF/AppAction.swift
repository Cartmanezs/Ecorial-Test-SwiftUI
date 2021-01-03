//
//  AppAction.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

extension AnyAction {
    struct SelectUserDetails: AppActionable {
        let user: UserInfo.Id
    }
    
    struct SetUserDetailsNavigation: AppActionable {
        let isPresented: Bool
    }
    
    struct UpdateUserTitle: AppActionable {
        let text: String
    }
    
    struct UpdateDateStart: AppActionable {
        let date: Date
    }
    
    struct UpdateDateEnd: AppActionable {
        let date: Date
    }
    
    struct AddUser: AppActionable {}
}
   
