//
//  MemberRoleView.swift
//  Mafia
//
//  Created by Reece Olsen on 1/19/22.
//

import SwiftUI

struct MemberRoleView: View {
    @StateObject var game: Game
    
    var body: some View {
        List(game.players) { player in
            ButtonRow(player: player)
        }
    }
//    func shuffle() {
//        player.role.shuffled()
//    }
}

struct ButtonRow: View {
    var player: GamePlayer
    
    var body: some View {
        NavigationLink(destination: MemberDetailRoleView()) {
            HStack {
                Button(action: {
                    // add to an array
                }) {
                    Text(player.name)
                }.foregroundColor(.black)
            }
        }
    }
}

struct MemberRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRoleView(game: Game.dummyData)
    }
}
