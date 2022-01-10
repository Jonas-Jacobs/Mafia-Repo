//
//  MembersList.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name = "String"
    var role = "String"
}

struct MembersList: View {
    var players: [Player]
    init(numberOfPlayers: Int) {
        players = numberOfPlayers.convertToArray().map({ _ in Player() })
    }
    
    var body: some View {
        NavigationView{
            List(players, id: \.id) { players in
                Text("hi")
            }
        }
    }
}

struct MembersList_Previews: PreviewProvider {
    static var previews: some View {
        MembersList(numberOfPlayers: 5)
    }
}

extension Int {
    func convertToArray() -> [Int] {
        return [Int](0...self)
    }
}
