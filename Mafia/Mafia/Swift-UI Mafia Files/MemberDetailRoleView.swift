//
//  MemberDetailRoleView.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/24/22.
//

import SwiftUI

struct MemberDetailRoleView: View {
    @StateObject var player: GamePlayer
    var body: some View {
            Text(player.name)
                .font(.title)
        VStack{
            HStack{
            Image(systemName: player.role.icon)
                    .foregroundColor(Color(player.role.value))
            Text(player.role.title)
            }
            Text(player.role.description)
        }
    }
}

struct MemberDetailRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetailRoleView(player: Game.dummyData.players[0])
    }
}
