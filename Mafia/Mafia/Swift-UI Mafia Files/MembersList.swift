//
//  MembersList.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name = "Enter your name"
    var role = "String"
}

struct MembersList: View {
    @State private var players: [Player]
    
    init(totalNumberOfPlayers: Int) {
        players = totalNumberOfPlayers.convertToArray().map({ _ in Player() })
        
    }
    
    var body: some View {
        List($players, id: \.id) { player in
            Section{
                TextField("Player enter your name", text: player.name)
            }
        }
    }
}

struct MembersList_Previews: PreviewProvider {
    static var previews: some View {
        MembersList(totalNumberOfPlayers: 5)
    }
}

extension Int {
    func convertToArray() -> [Int] {
        return [Int](0...self)
    }
}
