//
//  Roles.swift
//  Mafia
//
//  Created by Reece Olsen on 1/10/22.
//

import Foundation
import CloudKit

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
            GamePlayer(role: .mafia),
            GamePlayer(role: .mafia),
            GamePlayer(role: .mafia)
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
    let role: Role
    
    init(role: Role) {
        self.role = role
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
}

    

//    init?(id : Int) {
//        switch id {
//        case 1:
//            self = .mafia
//        case 2:
//            self = .villager
//        case 3:
//            self = .detective
//        case 4:
//            self = .healer
//        default:
//            return nil
//        }
//    }
//}

//extension Role {
//    static var allValues: [Role] {
//        var allValues: [Role] = []
//        switch (Role.mafia) {
//        case .mafia: allValues.append(.mafia); fallthrough
//        case .villager: allValues.append(.villager); fallthrough
//        case .detective: allValues.append(.detective); fallthrough
//        case .healer: allValues.append(.healer)
//        }
//        return allValues
//    }
//}

