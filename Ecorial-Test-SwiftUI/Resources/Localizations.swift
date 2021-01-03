//
//  Localizations.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 03.01.2021.
//

import Foundation

func LocalizedString(_ key: String) -> String {
    NSLocalizedString(key, comment: key)
}

struct Localizations {
    var addUser: AddUser{ AddUser() }
}

extension Localizations {
    struct AddUser {
        var title: String { LocalizedString("addUser_title") }
        var persName: String { LocalizedString("addUser_persons_name") }
        var persDescription: String { LocalizedString("addUser_persons_description") }
        var fullName: String { LocalizedString("addUser_full_name") }
        var startDate: String { LocalizedString("addUser_start_date") }
        var endDate: String { LocalizedString("addUser_end_date") }
        var buttonTitle: String { LocalizedString("addUser_button_title") }
    }
}
