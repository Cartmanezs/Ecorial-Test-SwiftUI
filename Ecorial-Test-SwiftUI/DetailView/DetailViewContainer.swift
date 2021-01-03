//
//  DetailViewContainer.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 03.01.2021.
//

import SwiftUI
import SwiftUI_UDF

struct DetailViewContainer: Container {
    typealias ContainerComponent = DetailViewComponent
    let userId: UserInfo.Id
    
    func map(state: AppState, store: AppEnvironmentStore) -> ContainerComponent.Props {
        .init(
            user: state.allUsers.byId[userId]!
        )
    }
    
    func onContainerAppear(store: AppEnvironmentStore) {
    }
}
