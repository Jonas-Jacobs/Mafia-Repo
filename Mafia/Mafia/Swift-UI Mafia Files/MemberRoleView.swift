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
            if player.isViewed == false {
                        NavigationLink(destination:
                                        MemberDetailRoleView(player: player))
                                       {
                            Text(player.name)
                    }
            } else {
                Button(action: {
                }) {
                    Text(player.name)
                        .foregroundColor(.gray)
                }
                //            ButtonRow(player: player, game: game)
            }
        }
    }
}

//struct ButtonRow: View {
//    var player: GamePlayer
//    var game: Game
//    @State var isActive = false
//    var body: some View {
//        NavigationLink(destination: MemberDetailRoleView(player: player), isActive: $isActive) {
//            HStack {
//                Button(action: {
//
//                }) {
//                    Text(player.name)
//                }.foregroundColor(.black)
//            }
//        }
//    }
//}

struct MemberRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRoleView(game: Game.dummyData)
    }
}
