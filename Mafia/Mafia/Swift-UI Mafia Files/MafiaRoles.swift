//
//  MafiaRoles.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct MafiaRoles: View {
    
    // @State roll variables
    
    var roles = Role.allCases
    @StateObject var game = Game()
    @State private var passesValidation = false
    @State private var showingNextScreen = false
    @StateObject var player: GamePlayer
    
    var body: some View {
        Form {
            Section {
                Text("Total number of players: \(game.players.count)")
            }
            Section(header: Text("Select number of rolls")){
                ForEach(roles) { role in
                    HStack{
                        Image(systemName: role.icon)
                            .foregroundColor(Color(role.value))
                    Stepper ("\(role.title): \(game.numberOfPlayers(for: role))") {
                        game.players.append(GamePlayer(name: "", role: role))
                    } onDecrement: {
                        guard let index = game.players.firstIndex(where: { $0.role == role }) else {
                            return
                        }
                        game.players.remove(at: index)
                        }
                    }
                }
            }
        }
        
        .navigationTitle("Select number of players")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if passesValidation {
                    NavigationLink("Submit",
                                   destination: MembersList(game: game),
                                   isActive: $showingNextScreen
                    )
                } else {
                    Text("Submit")
                        .foregroundColor(.gray)
                }
            }
        }
        .onChange(of: game.players.count) { newValue in
            if game.players.count >= 3 && game.numberOfPlayers(for: .mafia) >= 1 {
                passesValidation = true
            } else {
                passesValidation = false
            }
        }
    }
    
    struct MafiaRoles_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                MafiaRoles( player: Game.dummyData.players[0])
                    .preferredColorScheme(.light)
            }
        }
    }
}
