//
//  MembersList.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct MembersList: View {
    @State private var isTextFieldFocused = false
    @StateObject var game: Game
    @State var showingMemberRoleView = false
    @State var passesValidation = false
    
    var body: some View {
        List($game.players, id: \.id) { player in
            Section{
                TextField("Enter your name", text: player.name, onEditingChanged: { editingChanged in
                    isTextFieldFocused = editingChanged
                    checkingForNames()
                }) .accentColor(.black)
            }
        }
        .navigationTitle("Enter Player names")
        .onAppear(perform: {
            game.players.shuffle()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if passesValidation == true {
                    NavigationLink ("Submit",
                                    destination: MemberRoleView(game: game),
                                    isActive: $showingMemberRoleView  )
                } else {
                    Text("Submit")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    func checkingForNames() {
        let players = game.players
        for player in players {
            if player.name.isEmpty {
                passesValidation = false
                return
            } else {
                passesValidation = true
            }
        }
    }
}

struct MembersList_Previews: PreviewProvider {
    static var previews: some View {
        MembersList(game: Game.dummyData)
    }
}


