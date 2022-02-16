//
//  TransitionView.swift
//  Mafia
//
//  Created by Reece Olsen on 2/9/22.
//

import SwiftUI

struct TransitionView: View {
    @StateObject var player: GamePlayer
    var body: some View {


        Text("\(player.name)")

//        Text(player.isBeingKilled)


    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView(player: GamePlayer(name: "hello", role: .mafia))
    }
}

