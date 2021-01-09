//
//  UserInfo.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import Foundation

struct UserInfo: Hashable, Identifiable {
    struct Id: Hashable {
        let value: Int
    }
    var id: Id
    let name: String
    let description: String
    let dateStart: Date
    let dateEnd: Date
    let image: String
    let userPhoto: String
    let userStatus: UserStatus
}

// MARK: - Equatable
extension UserInfo: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id.value == rhs.id.value
    }
}

// MARK: - Faking
extension UserInfo: Faking {
    init() {
        id = .init(value: 1)
        name = "Steve Rogers"
        description = "Soldier, philanthropist, real hero"
        dateStart = Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date()
        dateEnd = Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date()
        image = "background"
        userPhoto = "userPhoto"
        userStatus = Int.random(in: 0...1) == 0 ? .none : .favorite
    }
    
    static func fakeItems() -> [UserInfo] {
        [
            .init(
                id: .init(value: 1),
                name: "Steve Rogers",
                description: "Soldier, philanthropist, real hero",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 2),
                name: "Test",
                description: "Test Test",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 3),
                name: "Igor",
                description: "Test Igor",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 4),
                name: "Mark",
                description: "Test Mark",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 5),
                name: "Jo",
                description: "Test Jo",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            )
        ]
    }
    
    static func fakeItems2() -> [UserInfo] {
        [
            .init(
                id: .init(value: 1),
                name: "1",
                description: "Soldier, philanthropist, real hero",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 2),
                name: "2",
                description: "Test Test",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 3),
                name: "3",
                description: "Test Igor",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 4),
                name: "4",
                description: "Test Mark",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            ),
            .init(
                id: .init(value: 5),
                name: "5",
                description: "Test Jo",
                dateStart: Calendar.current.date(byAdding: .month, value: 2, to: Date()) ?? Date(),
                dateEnd: Calendar.current.date(byAdding: .month, value: 3, to: Date()) ?? Date(),
                image: "background",
                userPhoto: "userPhoto",
                userStatus: Int.random(in: 0...1) == 0 ? .none : .favorite
            )
        ]
    }

}

enum UserStatus: String {
    case none
    case favorite
}
