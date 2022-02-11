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
                    PlayerList(game: game, playerSelected: player)
                    
                }
            }
        }
    }
}

struct PlayerList: View {
    var game: Game
    var playerSelected: GamePlayer
    var body: some View {
        VStack{
            NavigationLink(playerSelected.name,destination: TransitionView(player: doAction(game: game, selectedPlayer: playerSelected, currentPlayer: game.players[1])))
            
            
            
        }
    }
}
func doAction(game: Game, selectedPlayer: GamePlayer, currentPlayer: GamePlayer) -> GamePlayer {
    if currentPlayer.role == .mafia {
        selectedPlayer.isBeingKilled = true
    }
    return selectedPlayer
}

struct PlayerActionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerActionView(game: Game.dummyData)
    }
}
