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
        VStack(alignment: .leading) {
            Text("Note: You can only view player roles once")
        List(game.players) { player in
            if player.isViewed == false {
                NavigationLink(destination:
                                MemberDetailRoleView(player: player, objectDidChange: game.objectWillChange.send))
                {
                    Text("\(player.name)")
                }
            } else {
                Button(action: {
                }) {
                    Text(player.name)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Tap to view roles")
        }
    }
}

struct MemberRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRoleView(game: Game.dummyData)
    }
}
