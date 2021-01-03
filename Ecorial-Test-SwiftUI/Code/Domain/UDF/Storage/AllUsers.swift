//
//  AllProjects.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

struct AllUsers: Reducible {
    var byId: [UserInfo.Id: UserInfo] = [:]
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case let action as AnyAction.DidLoadItems<UserInfo> where action.id == UsersFlow.id:
            action.items.forEach { user in
                byId[user.id] = user
            }
            
        default:
            break
        }
    }
}
