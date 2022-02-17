//
//  MemberDetailRoleView.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/24/22.
//

import SwiftUI

struct MemberDetailRoleView: View {
    @StateObject var player: GamePlayer
    var objectDidChange: () -> Void
    var body: some View {
    
        Form{
            
            
            
            
            
                
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: player.role.icon).font(.largeTitle)
                        .foregroundColor(Color(player.role.value))
                    Text(player.role.title).font(.largeTitle)
                }
                
            }.onAppear {
                player.isViewed = true
                objectDidChange()
                
            }
            VStack(alignment: .leading){
                Text("\(player.role.description)")
            }
        }.navigationTitle(player.name)
        
    }
}

struct MemberDetailRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetailRoleView(player: Game.dummyData.players[0], objectDidChange: {})
    }
}
