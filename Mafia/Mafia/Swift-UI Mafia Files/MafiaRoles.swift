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
    
    @State private var passesValidation = true
    @State private var showingNextScreen = false
    @State private var alertShowing = false
    
    var errorMessage = "Your player number and roll numbers dont match"
    
    var totalNumberOfRolls: Int {
        villager + healer + detective + mafia
    }
    
    // Roll number calculators (so they cannot exceed limit of numberOfPlayers)
    
    var mafiaLimit: Int {
        numberOfPlayers - villager - healer - detective
    }
    
    var villagerLimit: Int {
        numberOfPlayers - mafia - healer - detective
    }
    
    var healerLimit: Int {
        numberOfPlayers - mafia - villager - detective
    }
    
    var detectiveLimit: Int {
        numberOfPlayers - mafia - villager - healer
    }
    
    var body: some View {
        
        Form{
            Section{
                Stepper("Number of players \(numberOfPlayers)", value: $numberOfPlayers, in: 0...20)
            }
            Section(header: Text("Select number of rolls")){
                Stepper("Mafia: \(mafia)", value: $mafia, in: 0...mafiaLimit)
                
                Stepper("Villager: \(villager)", value: $villager, in: 0...villagerLimit)
                
                Stepper("Healer: \(healer)", value: $healer, in: 0...healerLimit)
                
                Stepper("Detective: \(detective)", value: $detective, in: 0...detectiveLimit)
            }
        }
        
        .navigationTitle("Select number of players")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                if passesValidation {
                    NavigationLink("Submit",
                                   destination: MembersList(numberOfPlayers: numberOfPlayers),
                                   isActive: $showingNextScreen
                    )
                } else {
                    Text("Submit")
                        .foregroundColor(.gray)
                    
                }
            }
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
