//
//  MafiaRoles.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct MafiaRoles: View {
    
    // @State roll variables
    
    @State private var mafia = 0
    @State private var villager = 0
    @State private var healer = 0
    @State private var detective = 0
    @State var numberOfPlayers = 0
    
    @State private var passesValidation = false
    @State private var showingNextScreen = false
    
    var totalNumberOfPlayers: Int {
        villager + healer + detective + mafia
    }
    
    var body: some View {
        
        Form{
            Section{
                Text("Total number of players: \(totalNumberOfPlayers)")
            }
            Section(header: Text("Select number of rolls")){
                Stepper("Mafia: \(mafia)", value: $mafia, in: 0...5)
                
                Stepper("Villager: \(villager)", value: $villager, in: 0...10)
                
                Stepper("Healer: \(healer)", value: $healer, in: 0...5)
                
                Stepper("Detective: \(detective)", value: $detective, in: 0...5)
            }
        }
        
        .navigationTitle("Select number of players")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if passesValidation {
                    NavigationLink("Submit",
                                   destination: MembersList(totalNumberOfPlayers: totalNumberOfPlayers),
                                   isActive: $showingNextScreen
                    )
                } else {
                    Text("Submit")
                        .foregroundColor(.gray)
                }
            }
        }
        .onChange(of: totalNumberOfPlayers) { newValue in
            if totalNumberOfPlayers >= 3 && mafia >= 1 {
                passesValidation = true
            } else {
                passesValidation = false
            }
        }
    }
    
    
    struct MafiaRoles_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                MafiaRoles()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
