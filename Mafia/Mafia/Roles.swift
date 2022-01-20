//
//  Roles.swift
//  Mafia
//
//  Created by Reece Olsen on 1/10/22.
//

import Foundation
import CloudKit
struct Mafia: Identifiable{
    var id = UUID()
    var role: String
    var description: String
}
struct Game{
    var roles: [String] = []
    var playerNames: [String] = []
}
