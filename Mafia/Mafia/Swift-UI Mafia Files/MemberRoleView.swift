//
//  MemberRoleView.swift
//  Mafia
//
//  Created by Reece Olsen on 1/19/22.
//

import SwiftUI
class MemberRoleViewModel {
    private var viewedPlayers = Set<UUID>()

    func checkViewPlayers(gamePlayer: GamePlayer) -> Bool {
        return viewedPlayers.contains(gamePlayer.id)
    }
    func addPlayer(gamePlayer: GamePlayer) {
        viewedPlayers.insert(gamePlayer.id)
    }
}

struct MemberRoleView: View {
    @StateObject var game: Game
   
    var body: some View {
        List(game.players) { player in
            ButtonRow(player: player)
        }
    }
}

struct ButtonRow: View {
    var player: GamePlayer
  
    @State var isActive = false
    var body: some View {
        NavigationLink(destination: MemberDetailRoleView(player: player), isActive: $isActive) {
            HStack {
                Button(action: {
                    
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
