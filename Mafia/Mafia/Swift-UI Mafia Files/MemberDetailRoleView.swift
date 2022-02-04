//
//  MemberDetailRoleView.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/24/22.
//

import SwiftUI

struct MemberDetailRoleView: View {
    @StateObject var player: GamePlayer
    var icons = Role.allCases
//    var roleList: 
    
    var body: some View {
        VStack{
            Text(player.name)
            Text(player.role.title)
            Text(player.role.description)
        }
    }
}

struct MemberDetailRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetailRoleView(player: Game.dummyData.players[0])
    }
}
