//
//  PlayerActionView.swift
//  Mafia
//
//  Created by Reece Olsen on 2/8/22.
//

import SwiftUI

struct PlayerActionView: View {
    @StateObject var game: Game
    var body: some View {
        Form {
            Section{
                Text("\(game.players[1].role.description)")
            }
            Section(header: Text("action")){
                
                List(game.players){ player in
                    PlayerList(player: player)
                    
                }
            }
        }
    }
}

struct PlayerList: View {
    var player: GamePlayer
    var body: some View {
        VStack{
            Text("\(player.name)")
        }
    }
}

struct PlayerActionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerActionView(game: Game.dummyData)
    }
}
