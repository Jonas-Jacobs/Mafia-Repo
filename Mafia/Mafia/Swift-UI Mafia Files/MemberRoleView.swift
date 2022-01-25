//
//  MemberRoleView.swift
//  Mafia
//
//  Created by Reece Olsen on 1/19/22.
//

import SwiftUI

struct MemberRoleView: View {
    @StateObject var game: Game
    @State var showingNextScreen = false
    
    
    var body: some View {
        List($game.players, id: \.id) { player in
//            Text("\(game.$players) tap to view role")
        }
    }
    func toggleShowingScreen() {
        showingNextScreen.toggle()
    }
}

struct MemberRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRoleView(game: Game.dummyData)
    }
}
