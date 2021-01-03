//
//  Types.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation
import SwiftUI_UDF

typealias AppEnvironmentStore = EnvironmentStore<AppState>
typealias AppStore = Store<AppState>
typealias Reducible = SwiftUI_UDF.Reducible

typealias AppActionable = Actionable & Equatable
typealias AnyAction = SwiftUI_UDF.AnyAction

typealias Command = SwiftUI_UDF.Command
