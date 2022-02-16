//
//  Roles.swift
//  Mafia
//
//  Created by Reece Olsen on 1/10/22.
//

import Foundation
import CloudKit
import UIKit
import SwiftUI

// MARK: - Mafia

struct Mafia: Identifiable{
    var id = UUID()
    var role: String
    var description: String
}

// MARK: - Game

/// An object to hold all the data needed to make the game work.
/// This should be updated as you go along though the setup process.
class Game: ObservableObject {
    
    @Published var players = [GamePlayer]()
    
    func numberOfPlayers(for role: Role) -> Int {
        players.filter { player in
            player.role == role
        }.count
    }
    
    static var dummyData: Game {
        let game = Game()
        game.players = [
            GamePlayer(name: "hello1", role: .detective),
            GamePlayer(name: "hello2", role: .mafia),
            GamePlayer(name: "hello3", role: .mafia),
            GamePlayer(name: "hello4", role: .villager)
        ]
        return game
    }
    
}

// MARK: - Game Player

/// An object to hold the values of a palyer in the game.
/// This is used by the `Game` object.
class GamePlayer: Identifiable, Equatable, ObservableObject {
    @Published var id = UUID()
    @Published var name: String = ""
    @Published var isViewed: Bool = false
    let role: Role
    var isBeingKilled = false
    var isBeingHealed = false

    init(name: String, role: Role) {
        self.role = role
        self.name = name
    }

    // MARK: - Equatable Methods
    static func == (lhs: GamePlayer, rhs: GamePlayer) -> Bool {
        //TODO: FIX THIS LATER
        return true
    }
}

// MARK: - Role Enum

/// An enum to hold all the different role types.
enum Role: String, CaseIterable, Identifiable {
    case mafia
    case villager
    case detective
    case healer
    
    var id: String {
        title
    }
    var title: String {
        return self.rawValue.capitalized
    }
    var description: String {
        switch self
        {
        case .mafia:
            return "Mafia members vote on one player each night to attempt to kill."
        case .villager:
            return "The Villager has no special abilites."
        case .detective:
            return "The detectives vote on one player each night to investigate who the player sides with."
        case .healer:
            return "The doctors vote on one player each night to save in case they die that night."
        }
    }
    
    var icon: String {
        switch self {
        case .mafia:
            return "person.fill"
        case .villager:
            return "person.3.fill"
        case .detective:
            return "magnifyingglass"
        case .healer:
            return "bandage.fill"
        }
    }
}

extension Role {
    var value: UIColor {
        get {
            switch self {
            case .mafia:
                return UIColor.red
            case .villager:
                return UIColor.black
            case .detective:
                return UIColor.black
            case .healer:
                return UIColor.black
            }
        }
    }
}
