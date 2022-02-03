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
    @State var passesValidation = true

    
    var body: some View {
        List($game.players, id: \.id) { player in
            Section{
                TextField("Enter your name", text: player.name, onEditingChanged: { editingChanged in
                    isTextFieldFocused = editingChanged
                })
            }
        }
        .onAppear(perform: {
            game.players.shuffle()
        })
        .onChange(of: game.players) { unusedVariable in
            if game.players.count > 0 {
                passesValidation = true
            }
        }
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
    
}

struct MembersList_Previews: PreviewProvider {
    static var previews: some View {
        MembersList(game: Game.dummyData)
    }
}


