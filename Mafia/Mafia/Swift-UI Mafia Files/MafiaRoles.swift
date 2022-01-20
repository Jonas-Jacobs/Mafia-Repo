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
    
// new variable of type Game (see roles.swift) that will store the values for the current game,
//not currently working because idk what attribute it needs to be accessed by other views while being able to mutate
 // var currentGame: Game
    
//    var totalNumberOfPlayers: Int {
//        villager + healer + detective + mafia
//    }
    
    var body: some View {
        
        Form {
            Section {
                Text("Total number of players: \(game.players.count)")
            }
            Section(header: Text("Select number of rolls")){
                ForEach(roles) { role in
                    Stepper ("\(role.title): \(game.numberOfPlayers(for: role))") {
                        game.players.append(GamePlayer(role: role))
                    } onDecrement: {
                        guard let index = game.players.firstIndex(where: { $0.role == role }) else {
                            return
                        }
                        game.players.remove(at: index)
                    }
                    
                }

            }
        }
        
        .navigationTitle("Select number of players")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if passesValidation {
                    NavigationLink("Submit",
                                   destination: MembersList(totalNumberOfPlayers: game.players.count),
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
//    // Add each role value under "Game" Type (see the Game struct in roles.swift EX: if there were two villagers, and one mafia selected then --> currentGame.roles = ["Villager","Villager","Mafia"]
//    func gameSetup() -> Game{
//        while 0 < villager {
//            currentGame.roles.append("Villager")
//        }
//        while 0 < mafia {
//            currentGame.roles.append("Mafia")
//        }
//        while 0 < healer {
//            currentGame.roles.append("Healer")
//        }
//        while 0 < detective {
//            currentGame.roles.append("Detective")
//        }
//
//        return currentGame
//    }
//
    struct MafiaRoles_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                MafiaRoles()
                    .preferredColorScheme(.light)
            }
        }
    }
}
