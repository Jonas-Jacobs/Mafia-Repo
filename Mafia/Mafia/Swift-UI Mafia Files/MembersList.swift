//
//  MembersList.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name = "Enter your name"
    var role = "String"
}

struct MembersList: View {
    @State private var isTextFieldFocused = false
    @StateObject var game: Game
    
//    init(totalNumberOfPlayers: Int) {
//        players = totalNumberOfPlayers.convertToArray().map({ _ in Player() })
//
//    }
    
    var body: some View {
        List($game.players, id: \.id) { player in
            Section{
                TextField("Player enter your name", text: player.name, onEditingChanged: { editingChanged in
                    isTextFieldFocused = editingChanged
                })
                .foregroundColor(isTextFieldFocused ? Color.black  : Color.clear)
                
            }
        }
//        .onChange(of: game.players.count) { useLessVariable in
//            if game.players /= "" {
//
//            }
//
//        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                if  {
//                    NavigationLink {
//                        <#code#>
//                    } label: {
//                        "Submit"
//                    }
//
//                } else {
//                    Text("Submit")
//                        .font(.gray)
//                }
//
//            }
//        }
        
    }
}

struct MembersList_Previews: PreviewProvider {
    static var previews: some View {
        MembersList(game: Game.dummyData)
        
    }
}


